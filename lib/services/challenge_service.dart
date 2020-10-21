import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lsshelper/models/challenge.dart';

class ChallengeService {
  final CollectionReference _mondayCollectionReference =
      FirebaseFirestore.instance.collection("monday");

  Stream<List<ChallengeModel>> mondayChallengeStream() {
    return _mondayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final CollectionReference _tuesdayCollectionReference =
      FirebaseFirestore.instance.collection("tuesday");

  Stream<List<ChallengeModel>> tuesdayChallengeStream() {
    return _tuesdayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final CollectionReference _wednesdayCollectionReference =
      FirebaseFirestore.instance.collection("wednesday");

  Stream<List<ChallengeModel>> wednesdayChallengeStream() {
    return _wednesdayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final CollectionReference _thursdayCollectionReference =
      FirebaseFirestore.instance.collection("thursday");

  Stream<List<ChallengeModel>> thursdayChallengeStream() {
    return _thursdayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final CollectionReference _fridayCollectionReference =
      FirebaseFirestore.instance.collection("friday");

  Stream<List<ChallengeModel>> fridayChallengeStream() {
    return _fridayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final CollectionReference _saturdayCollectionReference =
      FirebaseFirestore.instance.collection("saturday");

  Stream<List<ChallengeModel>> saturdayChallengeStream() {
    return _saturdayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final CollectionReference _sundayCollectionReference =
      FirebaseFirestore.instance.collection("sunday");

  Stream<List<ChallengeModel>> sundayChallengeStream() {
    return _sundayCollectionReference
        // .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ChallengeModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ChallengeModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
