import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/settings_controller.dart';
import 'package:lsshelper/screens/widgets/my_drawer.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  final SettingsController controller =
      Get.put(SettingsController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   onWillPop: () async {
        //     return false;
        //   },
        //   child:
        Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(5, 0, 255, 1),
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Text(
            'Settings',
            style: TextStyle(
                fontSize: 30, color: Color.fromRGBO(255, 250, 250, 1)),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Challenges Settings:    ',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Base level'),
                      DropdownButton<String>(
                        value: controller.selectedBaseLev.value,
                        onChanged: (value) =>
                            controller.onBaseLevChanged(value),
                        items: [
                          '6-8',
                          '9-10',
                          '11-13',
                          '14-16',
                          '17-19',
                          '20-22',
                          '23-24',
                          '25'
                        ].map((String item) {
                          return DropdownMenuItem<String>(
                            child: Text('$item'),
                            value: item,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free Development day (Sunday)'),
                      DropdownButton<String>(
                        value: controller.selectedFreeDev.value,
                        onChanged: (value) =>
                            controller.onFreeDevChanged(value),
                        items: [
                          'Tech',
                          'Build',
                          'Gather',
                          'Hero',
                          'Troops',
                          'KE'
                        ].map((item) {
                          return DropdownMenuItem<String>(
                            child: Text('$item'),
                            value: item,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Warmup week'),
                      Checkbox(
                          value: controller.check.value,
                          onChanged: (value) => controller.checkVisible())
                    ],
                  ),
                ),
                // Opacity(
                //   opacity: controller.check.value ? 1.0 : 0.3,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Free Development day (Saturday)'),
                //       IgnorePointer(
                //         ignoring: !controller.check.value,
                //         child: DropdownButton<String>(
                //           value: controller.selectedFreeDevSat.value,
                //           onChanged: (value) =>
                //               controller.onFreeDevSatChanged(value),
                //           items: [
                //             'Gather',
                //             'Build',
                //             'Tech',
                //             'Hero',
                //             'Troops',
                //             'KE'
                //           ].map((item) {
                //             return DropdownMenuItem<String>(
                //               child: Text('$item'),
                //               value: item,
                //             );
                //           }).toList(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  'System Notifications:    ',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pause featured news notifications'),
                      Switch(
                          value: controller.newsNot.value,
                          onChanged: (value) =>
                              controller.checkVisibleNewsNot())
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pause push notifications'),
                      Switch(
                          value: controller.pushNot.value,
                          onChanged: (value) =>
                              controller.checkVisiblePushNot())
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Challenges Notifications:    ',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                              'Clear all challenges notifications and Alarms')),
                      Switch(
                          value: controller.clrChalNotAlm.value,
                          onChanged: (value) =>
                              controller.checkVisibleClrChalNotAlm())
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                              'Pause all challenges notifications and Alarms')),
                      Switch(
                          value: controller.pauseChalNotAlm.value,
                          onChanged: (value) =>
                              controller.checkVisiblePauseChalNotAlm())
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Screen Modes:    ',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Screen mode light/dark'),
                      Switch(
                          value: controller.screenMode.value,
                          onChanged: (value) =>
                              controller.checkVisibleScreenMode())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
