import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/auth_controller.dart';
import 'package:lsshelper/screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  final AuthController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .80,
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              // decoration: BoxDecoration(color: Colors.teal),
              accountName: Text(
                ctrl.currentUser.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(ctrl.currentUser.email),
              currentAccountPicture: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: ctrl.currentUser.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.settings)),
                        title: Text('Settings'),
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(SettingsScreen());
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.chat)),
                        title: Text('Feedback: Send a suggestion'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.report)),
                        title: Text('Feedback: Report a problem'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.chat_bubble_outline)),
                        title: Text('Terms and condition'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.policy)),
                        title: Text('Privacy policy'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.info)),
                        title: Text('About Us'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: new IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.star_border)),
                        title: Text('Rate Us'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.share)),
                        title: Text('Share With Friends'),
                        onTap: () {
                          // Share.share(
                          //     'check out my whatsApp status downloader https://github.com/moshTech/',
                          //     subject: 'Look what I made!');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      height: 38,
                      child: ListTile(
                        leading: IconTheme(
                            data: IconThemeData(color: Color(0xff757575)),
                            child: Icon(Icons.logout)),
                        title: Text('Log out'),
                        onTap: () {
                          ctrl.logout();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
