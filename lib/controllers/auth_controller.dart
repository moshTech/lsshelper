import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lsshelper/models/user.dart';
import 'package:lsshelper/screens/dashboard.dart';
import 'package:lsshelper/screens/login_page.dart';
import 'package:lsshelper/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum Status { loading, success, error, initialising }

class AuthController extends GetxController {
  final AuthService authService;
  AuthController({this.authService});
  UserModel get currentUser => authService.currentUser;

  // final CollectionReference _usersCollectionReference =
  //     FirebaseFirestore.instance.collection("users");

  Rx<File> image = Rx<File>();
  RxBool inProcess = false.obs;
  Rx<List<String>> urls = Rx<List<String>>();

  Future loadImage() async {
    var result = await authService.loadAssets();

    if (result is File) {
      image.value = result;
    }
  }

  final status = Status.initialising.obs;

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await authService.isUserLoggedIn();

    hasLoggedInUser ? Get.off(DashBoard()) : Get.off(LoginPage());
  }

  Future login({@required String email, @required String password}) async {
    status(Status.loading);

    var result =
        await authService.loginWithEmail(email: email, password: password);
    status(Status.success);

    if (result is bool) {
      if (result) {
        Get.offNamed('/DashBoard');
        Get.snackbar('Login success', 'Login successfully');
      } else {
        Get.snackbar('Login Failure',
            'Couldn\'t login at this moment. Please try again later',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else if (result.toString().contains('An internal error has occurred.') ||
        result.toString().contains(
            'A network error (such as timeout, interrupted connection or unreachable host) has occurred.')) {
      Get.snackbar('Login Failure',
          'No internet connection. Check your internet connection and try again.',
          snackPosition: SnackPosition.BOTTOM);
    } else if (result.toString().contains(
        'We have blocked all requests from this device due to unusual activity. Try again later.')) {
      Get.defaultDialog(
          title: 'Login Failure',
          content: Column(
            children: [
              Text('Too many request'),
              Text(
                  'You account has been suspended due to many incorrect password. Consider resetting your password or contact us'),
            ],
          ),
          cancel: FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('CANCEL'),
          ),
          confirm: FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('CONFIRM'),
          ));
    } else if (result.toString().contains('not verified')) {
      Get.defaultDialog(
        title: 'Account Verification',
        content: Text(
            'Please verify your account through the link sent to your email'),
        actions: [
          FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          )
        ],
      );
    } else {
      Get.snackbar('Login Failure', result,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future signup({
    @required String email,
    // @required String name,
    @required String username,
    @required String password,
    @required File file,
  }) async {
    status(Status.loading);

    var result = await authService.registerWithEmail(
        email: email,
        password: password,
        // name: name,
        username: username,
        file: file,
        title: email);

    status(Status.success);

    if (result is bool) {
      if (result) {
        // Get.offNamed('/DashBoard');
        Get.defaultDialog(
          title: 'Account Verification',
          content: Text(
              'Please verify you email through the link sent to your email'),
          actions: [
            FlatButton(
              onPressed: () {
                Get.back();
                Get.offAll(LoginPage());
              },
              child: Text('OK'),
            )
          ],
        );
      } else {
        Get.snackbar('Signup Failure',
            'Couldn\'t Signup at this moment. Please try again later',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else if (result.contains('username_exit')) {
      Get.snackbar('Signup Failure', 'Username already taken',
          snackPosition: SnackPosition.BOTTOM);
    } else if (result.toString().contains('An internal error has occurred.') ||
        result.toString().contains(
            'A network error (such as timeout, interrupted connection or unreachable host) has occurred.')) {
      Get.snackbar('Login Failure',
          'No internet connection. Check your internet connection and try again.',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Signup Failure', result,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() async {
    Get.offAllNamed('/login');
    authService.signOut();
  }
}
