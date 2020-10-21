import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // final String name;
  final String email;
  final String password;
  final String id;
  final String username;
  final String imageUrl;

  UserModel({
    // this.name,
    this.email,
    this.password,
    this.id,
    this.username,
    this.imageUrl,
  });

  UserModel.fromMap(Map<String, dynamic> data)
      :
        // name = data['name'],
        id = data['id'],
        password = data['password'],
        email = data['email'],
        username = data['username'],
        imageUrl = data['imageUrl'];

  UserModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  )   :
        // name = documentSnapshot.get('name'),
        id = documentSnapshot.id,
        password = documentSnapshot.get('password'),
        email = documentSnapshot.get('email'),
        username = documentSnapshot.get('username'),
        imageUrl = documentSnapshot.get('imageUrl');
}
