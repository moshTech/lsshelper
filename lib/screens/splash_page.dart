import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/auth_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthController ctrl = Get.find();
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    ctrl.handleStartUpLogic();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   'assets/images/logo.png',
          //   width: 200,
          //   height: 200,
          // ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
