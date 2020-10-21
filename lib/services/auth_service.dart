import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lsshelper/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      // user.reload();
      _currentUser = await getUser(user.uid);
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    if (user != null) {
      user.reload();
      await _populateCurrentUser(user);
    }
    return user != null && user.emailVerified;
  }

  Future loginWithEmail({@required email, @required password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user.emailVerified) {
        await _populateCurrentUser(authResult.user);

        return authResult.user != null;
      } else {
        return 'not verified';
      }
    } catch (e) {
      return e.message;
    }
  }

  Future registerWithEmail({
    // @required name,
    @required username,
    @required email,
    @required password,
    @required File file,
    @required title,
  }) async {
    // var result;
    try {
      var imgResult;
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final snapshot = await _usersCollectionReference.get();
      for (var user in snapshot.docs) {
        if (user.get('username') == username) {
          return 'username_exit';
        }
      }
      if (file != null) {
        imgResult = await saveImage(file: file, title: title);
      }
      await _usersCollectionReference.doc(result.user.uid).set({
        'id': result.user.uid,
        'email': email,
        // 'name': name,
        'username': username,
        'password': password,
        'imageUrl': imgResult,
      });

      await result.user.sendEmailVerification();
      return result.user != null;
    } catch (err) {
      print(err);
      return err.message;
    }
  }

  Future recoverPasswordWithEmail({
    @required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return null;
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String id) async {
    try {
      var userData = await _usersCollectionReference.doc(id).get();
      return UserModel.fromMap(
        userData.data(),
      );
    } catch (e) {
      return e;
    }
  }

  Future<void> signOut() async {
    _currentUser = UserModel();

    return _firebaseAuth.signOut();
  }

  List<Asset> images = List<Asset>();

  Future loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    var path;
    File cropped;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        // selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          // actionBarColor: "#abcdef",
          actionBarTitle: "LSSHelper",
          allViewTitle: "All Photos",
          useDetailsView: false,
          // selectCircleStrokeColor: "#000000",
        ),
      );

      if (resultList.length != null) {
        path =
            await FlutterAbsolutePath.getAbsolutePath(resultList[0].identifier);
        cropped = await ImageCropper.cropImage(
            sourcePath: path,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            compressQuality: 100,
            maxWidth: 700,
            maxHeight: 700,
            compressFormat: ImageCompressFormat.jpg,
            androidUiSettings: AndroidUiSettings(
              toolbarColor: Colors.green[100],
              toolbarTitle: "LSSHelper Cropper",
              statusBarColor: Colors.green.shade900,
              backgroundColor: Colors.white,
            ));
        images = resultList;
      }

      return cropped;
    } on Exception catch (e) {
      error = e.toString();
      return error;
    }
  }

  Future saveImage({
    File file,
    title,
  }) async {
    StorageReference ref = FirebaseStorage()
        .ref()
        .child(title); // To be aligned with the latest firebase API(4.0)
    StorageUploadTask uploadTask = ref.putFile(file);

    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }
}
