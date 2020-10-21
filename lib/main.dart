import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'shared/logger/logger_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LSS Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Data to database'),
      //   ),
      //   body: Center(
      //     child: RaisedButton(
      //       onPressed: () {
      //         print(DateTime.utc(DateTime.now().year, DateTime.now().month,
      //                 DateTime.now().day, 16, 40, 00)
      //             .toLocal());
      // firestore.collection("users").doc("name@xxx.com").get().then(function (doc) {
//     if (doc && doc.exists) {
//         var data = doc.data();
//         // saves the data to 'name'
//         firestore.collection("users").doc("name").set(data).then({
//             // deletes the old document
//             firestore.collection("users").doc("name@xxx.com").delete();
//         });
//     }
// });

      // FirebaseFirestore.instance
      //     .collection("monday")
      //     .doc('card1')
      //     .update({
      //   'diamondPointSix8': '',
      //   'diamondPointNine10': '',
      //   'diamondPointEleven13': '',
      //   'diamondPointFourteen16': '',
      //   'diamondPointSeventeen19': '',
      //   'diamondPointTwenty22': '',
      //   'diamondPointTwentythree24': '',
      //   'diamondPointTwentyfive': '',

      // 'challengeLine1': '',
      // 'challengeLine2': '',
      // 'challengeLine3': '',
      // 'challengeLine4': '',
      // 'challengeLine5': '',
      // 'color1': '',
      // 'color2': '',
      // 'color3': '',
      // 'color4': '',
      // 'color5': '',
      // 'six8': '',
      //   '50K / 350K / 2.55M',
      //   '50K / 350K / 2.45M',
      //   '50K / 350K / 2.45M'
      // ],
      // 'nine10': '',
      //   '50K / 450K / 2.95M',
      //   '50K / 450K / 2.75M',
      //   '50K / 450K / 2.75M'
      // ],
      // 'eleven13': '',
      //   '70K / 570K / 3.47M',
      //   '60K / 460K / 3.26M',
      //   '60K / 460K / 3.26M'
      // ],
      // 'fourteen16': '',
      //   '70K / 570K / 3.67M',
      //   '70K / 570K / 3.57M',
      //   '70K / 570K / 3.57M'
      // ],
      // 'seventeen19': '',
      //   '80K / 580K / 3.98M',
      //   '80K / 580K / 3.98M',
      //   '80K / 580K / 3.98M'
      // ],
      // 'twenty22': '',
      //   '90K / 690K / 4.59M',
      //   '80K / 680K / 4.48M',
      //   '80K / 680K / 4.48M'
      // ],
      // 'twentythree24': '',
      //   '100K / 800K / 5.1M',
      //   '90K / 690K / 4.79M',
      //   '90K / 690K / 4.79M'
      // ],
      // 'twentyfive': '',
      //   '100K / 800K / 5.1M',
      //   '100K / 800K / 502M',
      //   '100K / 800K / 502M'
      // ],
      //         });
      //   },
      //   child: Text('Add'),
      // ),
      // ),
      // ),
    );
  }
}
