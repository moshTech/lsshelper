import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/auth_controller.dart';
import 'package:lsshelper/screens/widgets/my_drawer.dart';

class Post extends StatelessWidget {
  final AuthController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Page'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}
