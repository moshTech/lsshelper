import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengeModel {
  final String challengeLine1;
  final String challengeLine2;
  final String challengeLine3;
  final String challengeLine4;
  final String challengeLine5;
  final String color1;
  final String color2;
  final String color3;
  final String color4;
  final String color5;
  final String six8;
  final String nine10;
  final String eleven13;
  final String fourteen16;
  final String seventeen19;
  final String twenty22;
  final String twentythree24;
  final String twentyfive;
  final String diamondPointSix8;
  final String diamondPointNine10;
  final String diamondPointEleven13;
  final String diamondPointFourteen16;
  final String diamondPointSeventeen19;
  final String diamondPointTwenty22;
  final String diamondPointTwentythree24;
  final String diamondPointTwentyfive;
  final String diamondColor;
  final String pointColor;
  // final String id;
  // final String point;
  // Timestamp dateCreated;

  ChallengeModel({
    this.challengeLine1,
    this.challengeLine2,
    this.challengeLine3,
    this.challengeLine4,
    this.challengeLine5,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.color5,
    this.six8,
    this.nine10,
    this.eleven13,
    this.fourteen16,
    this.seventeen19,
    this.twenty22,
    this.twentythree24,
    this.twentyfive,
    this.diamondColor,
    this.diamondPointSix8,
    this.diamondPointNine10,
    this.diamondPointEleven13,
    this.diamondPointFourteen16,
    this.diamondPointSeventeen19,
    this.diamondPointTwenty22,
    this.diamondPointTwentythree24,
    this.diamondPointTwentyfive,
    this.pointColor,

    // this.id,
    // this.point,
    // this.dateCreated,
  });

  // ChallengeModel.fromMap(Map<String, dynamic> data)
  //     :
  //       // id = data['id'],
  //       color1 = data['color1'],
  //       color2 = data['color2'],
  //       color3 = data['color3'],
  //       color4 = data['color4'],
  //       color5 = data['color5'],
  //       six8 = data['six8'],
  //       nine10 = data['nine10'],
  //       eleven13 = data['eleven13'],
  //       fourteen16 = data['fourteen16'],
  //       seventeen19 = data['seventeen19'],
  //       twenty22 = data['twenty22'],
  //       twentythree24 = data['twentythree24'],
  //       twentyfive = data['twentyfive'],
  //       challengeLine1 = data['challengeLine1'],
  //       challengeLine2 = data['challengeLine2'],
  //       challengeLine3 = data['challengeLine3'],
  //       challengeLine4 = data['challengeLine4'],
  //       challengeLine5 = data['challengeLine5'];
  // // dateCreated = data['dateCreated'],
  // // point = data['point'];

  ChallengeModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  )   :
        // id = documentSnapshot.id,
        color1 = documentSnapshot.get('color1'),
        color2 = documentSnapshot.get('color2'),
        color3 = documentSnapshot.get('color3'),
        color4 = documentSnapshot.get('color4'),
        color5 = documentSnapshot.get('color5'),
        six8 = documentSnapshot.get('six8'),
        nine10 = documentSnapshot.get('nine10'),
        eleven13 = documentSnapshot.get('eleven13'),
        fourteen16 = documentSnapshot.get('fourteen16'),
        seventeen19 = documentSnapshot.get('seventeen19'),
        twenty22 = documentSnapshot.get('twenty22'),
        twentythree24 = documentSnapshot.get('twentythree24'),
        twentyfive = documentSnapshot.get('twentyfive'),
        diamondColor = documentSnapshot.get('diamondColor'),
        diamondPointSix8 = documentSnapshot.get('diamondPointSix8'),
        diamondPointNine10 = documentSnapshot.get('diamondPointNine10'),
        diamondPointEleven13 = documentSnapshot.get('diamondPointEleven13'),
        diamondPointFourteen16 = documentSnapshot.get('diamondPointFourteen16'),
        diamondPointSeventeen19 =
            documentSnapshot.get('diamondPointSeventeen19'),
        diamondPointTwenty22 = documentSnapshot.get('diamondPointTwenty22'),
        diamondPointTwentythree24 =
            documentSnapshot.get('diamondPointTwentythree24'),
        diamondPointTwentyfive = documentSnapshot.get('diamondPointTwentyfive'),
        pointColor = documentSnapshot.get('pointColor'),
        challengeLine1 = documentSnapshot.get('challengeLine1'),
        challengeLine2 = documentSnapshot.get('challengeLine2'),
        challengeLine3 = documentSnapshot.get('challengeLine3'),
        challengeLine4 = documentSnapshot.get('challengeLine4'),
        challengeLine5 = documentSnapshot.get('challengeLine5');
  // dateCreated = documentSnapshot.get('dateCreated'),
  // point = documentSnapshot.get('point');
}
