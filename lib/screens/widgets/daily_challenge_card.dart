import 'package:flutter/material.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({
    Key key,
    this.point,
    this.diamondPoint,
    this.challengeLine1,
    this.challengeLine2,
    this.challengeLine3,
    this.challengeLine4,
    this.challengeLine5,
    this.img,
    this.index,
  }) : super(key: key);

  final Widget point;
  final Widget diamondPoint;
  final Widget challengeLine1;
  final Widget challengeLine2;
  final Widget challengeLine3;
  final Widget challengeLine4;
  final Widget challengeLine5;
  final Widget img;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(children: [
              Expanded(
                child: Column(
                  children: [
                    point,
                    SizedBox(
                      height: 2,
                    ),
                    diamondPoint,
                    Divider(
                      thickness: 3,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        challengeLine1,
                        challengeLine2,
                        challengeLine3,
                        challengeLine4,
                        challengeLine5,
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
                            ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    02,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) >
                                        9) &&
                                    ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    02,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) <
                                        24)
                                ? Text(
                                    '${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 02, 05, 00).toLocal().hour + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 02, 05, 00).toLocal().minute.toString()}',
                                    style: TextStyle(fontSize: 10),
                                  )
                                : ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    02,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) >
                                        23)
                                    ? Text(
                                        '0${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 02, 05, 00).toLocal().hour - 24 + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 02, 05, 00).toLocal().minute.toString()}',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    : Text(
                                        '0${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 02, 05, 00).toLocal().hour + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 02, 05, 00).toLocal().minute.toString()}',
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
                            ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    10,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) >
                                        9) &&
                                    ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    10,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) <
                                        24)
                                ? Text(
                                    '${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 05, 00).toLocal().hour + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 05, 00).toLocal().minute.toString()}',
                                    style: TextStyle(fontSize: 10),
                                  )
                                : ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    10,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) >
                                        23)
                                    ? Text(
                                        '0${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 05, 00).toLocal().hour - 24 + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 05, 00).toLocal().minute.toString()}',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    : Text(
                                        '0${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 05, 00).toLocal().hour + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 05, 00).toLocal().minute.toString()}',
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
                            ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    18,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) >
                                        9) &&
                                    ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    18,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) <
                                        24)
                                ? Text(
                                    '${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 05, 00).toLocal().hour + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 05, 00).toLocal().minute.toString()}',
                                    style: TextStyle(fontSize: 10),
                                  )
                                : ((DateTime.utc(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    18,
                                                    05,
                                                    00)
                                                .toLocal()
                                                .hour +
                                            index) >
                                        23)
                                    ? Text(
                                        '0${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 05, 00).toLocal().hour - 24 + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 05, 00).toLocal().minute.toString()}',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    : Text(
                                        '0${(DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 05, 00).toLocal().hour + index).toString()}:0${DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 05, 00).toLocal().minute.toString()}',
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
        // color: Colors.grey[850],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
    );
  }
}
