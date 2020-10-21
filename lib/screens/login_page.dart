import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/auth_controller.dart';

import 'signup_page.dart';

class LoginPage extends GetView<AuthController> {
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Get.defaultDialog(
                title: 'Are you sure',
                content: Text('Do you want to exit the app?'),
                cancel: FlatButton(
                  child: Text('No'),
                  onPressed: () => Get.back(result: false),
                ),
                confirm: FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Get.back(result: true),
                )) ??
            false;
      },
      child: Scaffold(
        body: Obx(() {
          Status status = controller.status.value;
          if (status == Status.error) return Text('Error on connection :(');
          return SafeArea(
            child: Form(
              key: _fbKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'LOGIN PAGE',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: emailCon,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (String arg) {
                          if (arg.isEmpty || arg == null)
                            return 'Email must not be empty';
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordCon,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (String arg) {
                          if (arg.length < 6)
                            return 'Password must be atleast 6 charaters long';
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot password?'),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_fbKey.currentState.validate()) {
                              _fbKey.currentState.save();
                              await controller.login(
                                  email: emailCon.text.trim(),
                                  password: passwordCon.text);
                            }
                          },
                          child: status == Status.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignupPage());
                        },
                        child: Center(
                          child: Text(
                            'Create account',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
