import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/settings_controller.dart';
import 'package:lsshelper/screens/widgets/my_drawer.dart';

import 'friday_screen.dart';
import 'monday_screen.dart';
import 'saturday_screen.dart';
import 'sunday_screen.dart';
import 'thursday_screen.dart';
import 'tuesday_screen.dart';
import 'wednesday_screen.dart';

class HomePage extends StatelessWidget {
  // final SettingsController settingsController =
  //     Get.put(SettingsController(), permanent: true);

  final Widget noneImg = Image.asset(
    'assets/images/none.png',
  );

  final Widget line = Image.asset(
    'assets/images/line.png',
  );

  final Widget both = Image.asset(
    'assets/images/both.png',
  );

  final Widget alarm = Image.asset(
    'assets/images/alarm.png',
    // height: 50,
  );

  final Widget not = Image.asset(
    'assets/images/not.png',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(61, 60, 60, 1),
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Text(
            'Game Helper',
            style: TextStyle(
              color: Color.fromRGBO(255, 250, 250, 1),
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: GetX<SettingsController>(
          init: Get.put<SettingsController>(Get.put(SettingsController()),
              permanent: true),
          builder: (SettingsController settingsController) {
            if (settingsController != null) {
              return PageView(
                children: [
                  MondayChallenge(
                    line: line,
                    img: both,
                  ),
                  TuesdayChallenge(
                    line: line,
                    img: both,
                  ),
                  WednesdayChallenge(
                    line: line,
                    img: both,
                  ),
                  ThursdayChallenge(
                    line: line,
                    img: both,
                  ),
                  FridayChallenge(
                    line: line,
                    img: both,
                  ),
                  settingsController.check.value ||
                          settingsController.warmupCheck
                      ? SaturdayChallenge(
                          line: line,
                          img: both,
                          tag: 'Build',
                        )
                      : SaturdayChallenge(
                          line: line,
                          img: both,
                        ),
                  settingsController.selectedFreeDev.value == 'Build' ||
                          settingsController.selectedFreeDev1 == 'Build'
                      ? TuesdayChallenge(
                          line: line,
                          img: both,
                          day: 'Sunday: ',
                        )
                      : settingsController.selectedFreeDev.value == 'Gather' ||
                              settingsController.selectedFreeDev1 == 'Gatther'
                          ? MondayChallenge(
                              line: line,
                              img: both,
                              day: 'Sunday: ',
                            )
                          : settingsController.selectedFreeDev.value ==
                                      'Hero' ||
                                  settingsController.selectedFreeDev.value ==
                                      'Hero'
                              ? ThursdayChallenge(
                                  line: line,
                                  img: both,
                                  day: 'Sunday: ',
                                )
                              : settingsController.selectedFreeDev.value ==
                                          'Train' ||
                                      settingsController
                                              .selectedFreeDev.value ==
                                          'Train'
                                  ? FridayChallenge(
                                      line: line,
                                      img: both,
                                      day: 'Sunday: ',
                                    )
                                  : settingsController.selectedFreeDev.value ==
                                              'KE' ||
                                          settingsController
                                                  .selectedFreeDev.value ==
                                              'KE'
                                      ? SaturdayChallenge(
                                          line: line,
                                          img: both,
                                          day: 'Sunday: ',
                                        )
                                      : SundayChallenge(
                                          line: line,
                                          img: both,
                                        ),
                ],
              );
            } else {
              return Center(child: Text("Loading..."));
            }
          },
        ),
      ),
    );
  }
}
