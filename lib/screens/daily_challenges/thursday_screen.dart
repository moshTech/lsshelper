import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsshelper/controllers/challenge_controller.dart';
import 'package:lsshelper/controllers/settings_controller.dart';
import 'package:lsshelper/screens/widgets/daily_challenge_card.dart';
import 'package:lsshelper/services/challenge_service.dart';

class ThursdayChallenge extends StatelessWidget {
  ThursdayChallenge({
    Key key,
    @required this.line,
    @required this.img,
    this.day,
  }) : super(key: key);

  final Widget line;
  final Widget img;
  final String day;

  final SettingsController settingsController =
      Get.put(SettingsController(), permanent: true);

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Material(
            type: MaterialType.transparency,
            child: RichText(
              text: TextSpan(
                  text: day == null ? 'Thursday: ' : day,
                  style: TextStyle(
                    color: Color.fromRGBO(250, 255, 0, 1),
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: 'Heroes',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(child: line),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .58,
          child: Card(
            color: Color.fromRGBO(37, 31, 105, 0.97),
            margin: EdgeInsets.only(top: 8, left: 4),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: RichText(
                text: TextSpan(
                    text: 'Current Challenge: Thursday, ',
                    style: TextStyle(
                      // color: Color.fromRGBO(250, 255, 0, 1),
                      color: Colors.orange,
                      fontSize: 10,
                    ),
                    children: [
                      TextSpan(
                        text: 'Heroes',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      )
                    ]),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )),
          ),
        ),
        Card(
          color: Color.fromRGBO(37, 31, 105, 0.97),
          margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'point',
                        style: TextStyle(
                          // color:
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'point',
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            'point',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    // color: Colors.white,
                    thickness: 3,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .35,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // width: 55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              img,
                              Text(
                                '08:05',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: 55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              img,
                              Text(
                                '10:05',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: 55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              img,
                              Text(
                                '12:05',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        Expanded(
          child: GetX<ChallengeController>(
            init: Get.put<ChallengeController>(
                ChallengeController(
                    challengeService: Get.put(ChallengeService())),
                permanent: true),
            builder: (ChallengeController challengeController) {
              if (challengeController != null &&
                  challengeController.thursdayChallenges != null) {
                return ListView.builder(
                  itemCount: 8,
                  // addAutomaticKeepAlives: false,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => DailyChallengeCard(
                        img: img,
                        index: index,
                        point: settingsController.selectedBaseLev.value ==
                                '9-10' || settingsController.selectedBaseLev1 =='9-10'
                            ? (challengeController.thursdayChallenges[index].nine10.isEmpty ||
                                    challengeController.thursdayChallenges[index].nine10 ==
                                        null)
                                ? Container()
                                : Text(
                                    'Points: ${challengeController.thursdayChallenges[index].nine10}',
                                    style: TextStyle(
                                      color: (challengeController
                                                  .thursdayChallenges[index]
                                                  .pointColor
                                                  .isEmpty ||
                                              challengeController
                                                      .thursdayChallenges[index]
                                                      .pointColor ==
                                                  null)
                                          ? null
                                          : Color(int.parse(challengeController
                                              .thursdayChallenges[index]
                                              .pointColor)),
                                      fontSize: 11,
                                    ),
                                  )
                            : settingsController.selectedBaseLev.value ==
                                    '11-13' || settingsController.selectedBaseLev1 =='11-13'
                                ? (challengeController.thursdayChallenges[index]
                                            .eleven13.isEmpty ||
                                        challengeController.thursdayChallenges[index].eleven13 ==
                                            null)
                                    ? Container()
                                    : Text(
                                        'Points: ${challengeController.thursdayChallenges[index].eleven13}',
                                        style: TextStyle(
                                          color: (challengeController
                                                      .thursdayChallenges[index]
                                                      .pointColor
                                                      .isEmpty ||
                                                  challengeController
                                                          .thursdayChallenges[
                                                              index]
                                                          .pointColor ==
                                                      null)
                                              ? null
                                              : Color(int.parse(
                                                  challengeController
                                                      .thursdayChallenges[index]
                                                      .pointColor)),
                                          fontSize: 11,
                                        ),
                                      )
                                : settingsController.selectedBaseLev.value ==
                                        '14-16' || settingsController.selectedBaseLev1 =='14-16'
                                    ? (challengeController
                                                .thursdayChallenges[index]
                                                .fourteen16
                                                .isEmpty ||
                                            challengeController
                                                    .thursdayChallenges[index]
                                                    .fourteen16 ==
                                                null)
                                        ? Container()
                                        : Text(
                                            'Points: ${challengeController.thursdayChallenges[index].fourteen16}',
                                            style: TextStyle(
                                              color: (challengeController
                                                          .thursdayChallenges[
                                                              index]
                                                          .pointColor
                                                          .isEmpty ||
                                                      challengeController
                                                              .thursdayChallenges[
                                                                  index]
                                                              .pointColor ==
                                                          null)
                                                  ? null
                                                  : Color(int.parse(
                                                      challengeController
                                                          .thursdayChallenges[
                                                              index]
                                                          .pointColor)),
                                              fontSize: 11,
                                            ),
                                          )
                                    : settingsController.selectedBaseLev.value ==
                                            '17-19' || settingsController.selectedBaseLev1 =='17-19'
                                        ? (challengeController
                                                    .thursdayChallenges[index]
                                                    .seventeen19
                                                    .isEmpty ||
                                                challengeController
                                                        .thursdayChallenges[index]
                                                        .seventeen19 ==
                                                    null)
                                            ? Container()
                                            : Text(
                                                'Points: ${challengeController.thursdayChallenges[index].seventeen19}',
                                                style: TextStyle(
                                                  color: (challengeController
                                                              .thursdayChallenges[
                                                                  index]
                                                              .pointColor
                                                              .isEmpty ||
                                                          challengeController
                                                                  .thursdayChallenges[
                                                                      index]
                                                                  .pointColor ==
                                                              null)
                                                      ? null
                                                      : Color(int.parse(
                                                          challengeController
                                                              .thursdayChallenges[
                                                                  index]
                                                              .pointColor)),
                                                  fontSize: 11,
                                                ),
                                              )
                                        : settingsController.selectedBaseLev.value == '20-22' || settingsController.selectedBaseLev1 =='20-22'
                                            ? (challengeController.thursdayChallenges[index].twenty22.isEmpty || challengeController.thursdayChallenges[index].twenty22 == null)
                                                ? Container()
                                                : Text(
                                                    'Points: ${challengeController.thursdayChallenges[index].twenty22}',
                                                    style: TextStyle(
                                                      color: (challengeController
                                                                  .thursdayChallenges[
                                                                      index]
                                                                  .pointColor
                                                                  .isEmpty ||
                                                              challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .pointColor ==
                                                                  null)
                                                          ? null
                                                          : Color(int.parse(
                                                              challengeController
                                                                  .thursdayChallenges[
                                                                      index]
                                                                  .pointColor)),
                                                      fontSize: 11,
                                                    ),
                                                  )
                                            : settingsController.selectedBaseLev.value == '23-24' || settingsController.selectedBaseLev1 =='23-24'
                                                ? (challengeController.thursdayChallenges[index].twentythree24.isEmpty || challengeController.thursdayChallenges[index].twentythree24 == null)
                                                    ? Container()
                                                    : Text(
                                                        'Points: ${challengeController.thursdayChallenges[index].twentythree24}',
                                                        style: TextStyle(
                                                          color: (challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .pointColor
                                                                      .isEmpty ||
                                                                  challengeController
                                                                          .thursdayChallenges[
                                                                              index]
                                                                          .pointColor ==
                                                                      null)
                                                              ? null
                                                              : Color(int.parse(
                                                                  challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .pointColor)),
                                                          fontSize: 11,
                                                        ),
                                                      )
                                                : settingsController.selectedBaseLev.value == '25' || settingsController.selectedBaseLev1 =='25'
                                                    ? (challengeController.thursdayChallenges[index].twentyfive.isEmpty || challengeController.thursdayChallenges[index].twentyfive == null)
                                                        ? Container()
                                                        : Text(
                                                            'Points: ${challengeController.thursdayChallenges[index].twentyfive}',
                                                            style: TextStyle(
                                                              color: (challengeController
                                                                          .thursdayChallenges[
                                                                              index]
                                                                          .pointColor
                                                                          .isEmpty ||
                                                                      challengeController
                                                                              .thursdayChallenges[
                                                                                  index]
                                                                              .pointColor ==
                                                                          null)
                                                                  ? null
                                                                  : Color(int.parse(challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .pointColor)),
                                                              fontSize: 11,
                                                            ),
                                                          )
                                                    : (challengeController.thursdayChallenges[index].six8.isEmpty || challengeController.thursdayChallenges[index].six8 == null)
                                                        ? Container()
                                                        : Text(
                                                            'Points: ${challengeController.thursdayChallenges[index].six8}',
                                                            style: TextStyle(
                                                              color: (challengeController
                                                                          .thursdayChallenges[
                                                                              index]
                                                                          .pointColor
                                                                          .isEmpty ||
                                                                      challengeController
                                                                              .thursdayChallenges[
                                                                                  index]
                                                                              .pointColor ==
                                                                          null)
                                                                  ? null
                                                                  : Color(int.parse(challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .pointColor)),
                                                              fontSize: 11,
                                                            ),
                                                          ),
                        diamondPoint: settingsController.selectedBaseLev.value ==
                                '9-10' || settingsController.selectedBaseLev1 =='9-10'
                            ? (challengeController.thursdayChallenges[index]
                                        .diamondPointNine10.isEmpty ||
                                    challengeController.thursdayChallenges[index].diamondPointNine10 ==
                                        null)
                                ? Container()
                                : Text(
                                    'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointNine10}',
                                    style: TextStyle(
                                      color: (challengeController
                                                  .thursdayChallenges[index]
                                                  .diamondColor
                                                  .isEmpty ||
                                              challengeController
                                                      .thursdayChallenges[index]
                                                      .diamondColor ==
                                                  null)
                                          ? null
                                          : Color(int.parse(challengeController
                                              .thursdayChallenges[index]
                                              .diamondColor)),
                                      fontSize: 11,
                                    ),
                                  )
                            : settingsController.selectedBaseLev.value ==
                                    '11-13' || settingsController.selectedBaseLev1 =='11-13'
                                ? (challengeController.thursdayChallenges[index]
                                            .diamondPointEleven13.isEmpty ||
                                        challengeController
                                                .thursdayChallenges[index]
                                                .diamondPointEleven13 ==
                                            null)
                                    ? Container()
                                    : Text(
                                        'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointEleven13}',
                                        style: TextStyle(
                                          color: (challengeController
                                                      .thursdayChallenges[index]
                                                      .diamondColor
                                                      .isEmpty ||
                                                  challengeController
                                                          .thursdayChallenges[
                                                              index]
                                                          .diamondColor ==
                                                      null)
                                              ? null
                                              : Color(int.parse(
                                                  challengeController
                                                      .thursdayChallenges[index]
                                                      .diamondColor)),
                                          fontSize: 11,
                                        ),
                                      )
                                : settingsController.selectedBaseLev.value ==
                                        '14-16' || settingsController.selectedBaseLev1 =='14-16'
                                    ? (challengeController
                                                .thursdayChallenges[index]
                                                .diamondPointFourteen16
                                                .isEmpty ||
                                            challengeController
                                                    .thursdayChallenges[index]
                                                    .diamondPointFourteen16 ==
                                                null)
                                        ? Container()
                                        : Text(
                                            'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointFourteen16}',
                                            style: TextStyle(
                                              color: (challengeController
                                                          .thursdayChallenges[
                                                              index]
                                                          .diamondColor
                                                          .isEmpty ||
                                                      challengeController
                                                              .thursdayChallenges[
                                                                  index]
                                                              .diamondColor ==
                                                          null)
                                                  ? null
                                                  : Color(int.parse(
                                                      challengeController
                                                          .thursdayChallenges[
                                                              index]
                                                          .diamondColor)),
                                              fontSize: 11,
                                            ),
                                          )
                                    : settingsController.selectedBaseLev.value ==
                                            '17-19' || settingsController.selectedBaseLev1 =='17-19'
                                        ? (challengeController
                                                    .thursdayChallenges[index]
                                                    .diamondPointSeventeen19
                                                    .isEmpty ||
                                                challengeController.thursdayChallenges[index].diamondPointSeventeen19 == null)
                                            ? Container()
                                            : Text(
                                                'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointSeventeen19}',
                                                style: TextStyle(
                                                  color: (challengeController
                                                              .thursdayChallenges[
                                                                  index]
                                                              .diamondColor
                                                              .isEmpty ||
                                                          challengeController
                                                                  .thursdayChallenges[
                                                                      index]
                                                                  .diamondColor ==
                                                              null)
                                                      ? null
                                                      : Color(int.parse(
                                                          challengeController
                                                              .thursdayChallenges[
                                                                  index]
                                                              .diamondColor)),
                                                  fontSize: 11,
                                                ),
                                              )
                                        : settingsController.selectedBaseLev.value == '20-22' || settingsController.selectedBaseLev1 =='20-22'
                                            ? (challengeController.thursdayChallenges[index].diamondPointTwenty22.isEmpty || challengeController.thursdayChallenges[index].diamondPointTwenty22 == null)
                                                ? Container()
                                                : Text(
                                                    'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointTwenty22}',
                                                    style: TextStyle(
                                                      color: (challengeController
                                                                  .thursdayChallenges[
                                                                      index]
                                                                  .diamondColor
                                                                  .isEmpty ||
                                                              challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .diamondColor ==
                                                                  null)
                                                          ? null
                                                          : Color(int.parse(
                                                              challengeController
                                                                  .thursdayChallenges[
                                                                      index]
                                                                  .diamondColor)),
                                                      fontSize: 11,
                                                    ),
                                                  )
                                            : settingsController.selectedBaseLev.value == '23-24' || settingsController.selectedBaseLev1 =='23-24'
                                                ? (challengeController.thursdayChallenges[index].diamondPointTwentythree24.isEmpty || challengeController.thursdayChallenges[index].diamondPointTwentythree24 == null)
                                                    ? Container()
                                                    : Text(
                                                        'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointTwentythree24}',
                                                        style: TextStyle(
                                                          color: (challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .diamondColor
                                                                      .isEmpty ||
                                                                  challengeController
                                                                          .thursdayChallenges[
                                                                              index]
                                                                          .diamondColor ==
                                                                      null)
                                                              ? null
                                                              : Color(int.parse(
                                                                  challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .diamondColor)),
                                                          fontSize: 11,
                                                        ),
                                                      )
                                                : settingsController.selectedBaseLev.value == '25' || settingsController.selectedBaseLev1 =='25'
                                                    ? (challengeController.thursdayChallenges[index].diamondPointTwentyfive.isEmpty || challengeController.thursdayChallenges[index].diamondPointTwentyfive == null)
                                                        ? Container()
                                                        : Text(
                                                            'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointTwentyfive}',
                                                            style: TextStyle(
                                                              color: (challengeController
                                                                          .thursdayChallenges[
                                                                              index]
                                                                          .diamondColor
                                                                          .isEmpty ||
                                                                      challengeController
                                                                              .thursdayChallenges[
                                                                                  index]
                                                                              .diamondColor ==
                                                                          null)
                                                                  ? null
                                                                  : Color(int.parse(challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .diamondColor)),
                                                              fontSize: 11,
                                                            ),
                                                          )
                                                    : (challengeController.thursdayChallenges[index].diamondPointSix8.isEmpty || challengeController.thursdayChallenges[index].diamondPointSix8 == null)
                                                        ? Container()
                                                        : Text(
                                                            'Diamonds: ${challengeController.thursdayChallenges[index].diamondPointSix8}',
                                                            style: TextStyle(
                                                              color: (challengeController
                                                                          .thursdayChallenges[
                                                                              index]
                                                                          .diamondColor
                                                                          .isEmpty ||
                                                                      challengeController
                                                                              .thursdayChallenges[
                                                                                  index]
                                                                              .diamondColor ==
                                                                          null)
                                                                  ? null
                                                                  : Color(int.parse(challengeController
                                                                      .thursdayChallenges[
                                                                          index]
                                                                      .diamondColor)),
                                                              fontSize: 11,
                                                            ),
                                                          ),
                        challengeLine1: (challengeController
                                    .thursdayChallenges[index]
                                    .challengeLine1
                                    .isEmpty ||
                                challengeController.thursdayChallenges[index]
                                        .challengeLine1 ==
                                    null)
                            ? Container()
                            : Text(
                                challengeController
                                    .thursdayChallenges[index].challengeLine1,
                                style: TextStyle(
                                  color: (challengeController
                                              .thursdayChallenges[index]
                                              .color1
                                              .isEmpty ||
                                          challengeController
                                                  .thursdayChallenges[index]
                                                  .color1 ==
                                              null)
                                      ? null
                                      : Color(int.parse(challengeController
                                          .thursdayChallenges[index].color1)),
                                  fontSize: 11,
                                ),
                              ),
                        challengeLine2: (challengeController
                                    .thursdayChallenges[index]
                                    .challengeLine2
                                    .isEmpty ||
                                challengeController.thursdayChallenges[index]
                                        .challengeLine2 ==
                                    null)
                            ? Container()
                            : Text(
                                challengeController
                                    .thursdayChallenges[index].challengeLine2,
                                style: TextStyle(
                                  color: (challengeController
                                              .thursdayChallenges[index]
                                              .color2
                                              .isEmpty ||
                                          challengeController
                                                  .thursdayChallenges[index]
                                                  .color2 ==
                                              null)
                                      ? null
                                      : Color(int.parse(challengeController
                                          .thursdayChallenges[index].color2)),
                                  fontSize: 11,
                                ),
                              ),
                        challengeLine3: (challengeController
                                    .thursdayChallenges[index]
                                    .challengeLine3
                                    .isEmpty ||
                                challengeController.thursdayChallenges[index]
                                        .challengeLine3 ==
                                    null)
                            ? Container()
                            : Text(
                                challengeController
                                    .thursdayChallenges[index].challengeLine3,
                                style: TextStyle(
                                  color: (challengeController
                                              .thursdayChallenges[index]
                                              .color3
                                              .isEmpty ||
                                          challengeController
                                                  .thursdayChallenges[index]
                                                  .color3 ==
                                              null)
                                      ? null
                                      : Color(int.parse(challengeController
                                          .thursdayChallenges[index].color3)),
                                  fontSize: 11,
                                ),
                              ),
                        challengeLine4: (challengeController
                                    .thursdayChallenges[index]
                                    .challengeLine4
                                    .isEmpty ||
                                challengeController.thursdayChallenges[index]
                                        .challengeLine4 ==
                                    null)
                            ? Container()
                            : Text(
                                challengeController
                                    .thursdayChallenges[index].challengeLine4,
                                style: TextStyle(
                                  color: (challengeController
                                              .thursdayChallenges[index]
                                              .color4
                                              .isEmpty ||
                                          challengeController
                                                  .thursdayChallenges[index]
                                                  .color4 ==
                                              null)
                                      ? null
                                      : Color(int.parse(challengeController
                                          .thursdayChallenges[index].color4)),
                                  fontSize: 11,
                                ),
                              ),
                        challengeLine5: (challengeController
                                    .thursdayChallenges[index]
                                    .challengeLine5
                                    .isEmpty ||
                                challengeController.thursdayChallenges[index]
                                        .challengeLine5 ==
                                    null)
                            ? Container()
                            : Text(
                                challengeController
                                    .thursdayChallenges[index].challengeLine5,
                                style: TextStyle(
                                  color: (challengeController
                                              .thursdayChallenges[index]
                                              .color5
                                              .isEmpty ||
                                          challengeController
                                                  .thursdayChallenges[index]
                                                  .color5 ==
                                              null)
                                      ? null
                                      : Color(int.parse(challengeController
                                          .thursdayChallenges[index].color5)),
                                  fontSize: 11,
                                ),
                              ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("Loading..."));
              }
            },
          ),
        )
      ],
    );
  }
}
