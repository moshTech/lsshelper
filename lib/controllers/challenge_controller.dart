import 'package:get/get.dart';
import 'package:lsshelper/models/challenge.dart';
import 'package:lsshelper/services/challenge_service.dart';

enum Stat { loading, success, error, initialising }

class ChallengeController extends GetxController {
  final ChallengeService challengeService;

  ChallengeController({this.challengeService});

  final status = Stat.initialising.obs;

  Rx<List<ChallengeModel>> mondayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get mondayChallenges => mondayChallengeList.value;

  Rx<List<ChallengeModel>> tuesdayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get tuesdayChallenges => tuesdayChallengeList.value;

  Rx<List<ChallengeModel>> wednesdayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get wednesdayChallenges => wednesdayChallengeList.value;

  Rx<List<ChallengeModel>> thursdayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get thursdayChallenges => thursdayChallengeList.value;

  Rx<List<ChallengeModel>> fridayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get fridayChallenges => fridayChallengeList.value;

  Rx<List<ChallengeModel>> saturdayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get saturdayChallenges => saturdayChallengeList.value;

  Rx<List<ChallengeModel>> sundayChallengeList = Rx<List<ChallengeModel>>();

  List<ChallengeModel> get sundayChallenges => sundayChallengeList.value;

  @override
  void onInit() async {
    mondayChallengeList.bindStream(
        challengeService.mondayChallengeStream()); //stream coming from firebase
    tuesdayChallengeList.bindStream(challengeService.tuesdayChallengeStream());
    wednesdayChallengeList
        .bindStream(challengeService.wednesdayChallengeStream());
    thursdayChallengeList
        .bindStream(challengeService.thursdayChallengeStream());
    fridayChallengeList.bindStream(challengeService.fridayChallengeStream());
    saturdayChallengeList
        .bindStream(challengeService.saturdayChallengeStream());
    sundayChallengeList.bindStream(challengeService.sundayChallengeStream());
  }
}
