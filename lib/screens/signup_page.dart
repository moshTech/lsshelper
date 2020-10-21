import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/auth_controller.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  // final TextEditingController nameCon = TextEditingController();
  final TextEditingController usernameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AuthController>(
          init: Get.put<AuthController>(AuthController(), permanent: true),
          builder: (AuthController authController) {
            if (authController != null) {
              Status status = authController.status.value;
              // if (status == Status.loading) return CircularProgressIndicator();
              if (status == Status.error) return Text('Error on connection :(');
              return SafeArea(
                child: Form(
                  key: _fbKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 50,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'SIGNUP PAGE',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 25,
                          // ),
                          // TextFormField(
                          //   controller: nameCon,
                          //   decoration: InputDecoration(
                          //     hintText: 'Full Name',
                          //   ),
                          //   validator: (String arg) {
                          //     if (arg.isEmpty || arg == null)
                          //       return 'Name must not be empty';
                          //     else
                          //       return null;
                          //   },
                          //   textCapitalization: TextCapitalization.sentences,
                          // ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: usernameCon,
                            decoration: InputDecoration(
                              hintText: 'Username',
                            ),
                            validator: (String arg) {
                              if (arg.length < 3)
                                return 'Username must be atleat 3 charaters long';
                              else
                                return null;
                            },
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
                            height: 30,
                          ),
                          Text('Upload Profile Picture'),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              authController.image.value == null
                                  ? CircleAvatar(
                                      radius: 50,
                                      // backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.person,
                                        // color: Colors.green,
                                        size: 50,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage: Image(
                                        image: FileImage(
                                            authController.image.value),
                                      ).image,
                                    ),
                              SizedBox(width: 35),
                              RaisedButton(
                                onPressed: () async {
                                  await authController.loadImage();
                                },
                                child: Text(
                                  'Pick Image',
                                  style: TextStyle(
                                    // fontSize: 17,
                                    color: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 45,
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () async {
                                if (_fbKey.currentState.validate()) {
                                  _fbKey.currentState.save();
                                  if (authController.image.value == null) {
                                    Get.defaultDialog(
                                        title: 'Signup Info',
                                        content: Text(
                                            'Please select your profile picture'));
                                  } else {
                                    await authController.signup(
                                      email: emailCon.text.trim(),
                                      password: passwordCon.text,
                                      // name: nameCon.text,
                                      username: usernameCon.text,
                                      file: authController.image.value,
                                    );
                                    // imgCtrl.saveImage(
                                    //     file: imgCtrl.image.value,
                                    //     title: usernameCon.text,
                                    //     username: usernameCon.text);
                                  }
                                }
                              },
                              child: status == Status.loading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Get.isDarkMode
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.off(LoginPage());
                            },
                            child: Center(
                              child: Text(
                                'Sign in instead',
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
            } else {
              return null;
            }
          }),
    );
  }
}
