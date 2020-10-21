import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/screens/daily_post/post.dart';

class DashBoard extends StatelessWidget {
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
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    Get.to(Post());
                  },
                  child: Card(
                    child: Center(child: Text('Post Page')),
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/home");
                  },
                  child: Card(
                    child: Center(child: Text('Daily Challenge')),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
