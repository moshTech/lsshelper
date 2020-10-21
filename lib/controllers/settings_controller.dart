import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  var selectedBaseLev = '6-8'.obs;
  var selectedFreeDev = 'Tech'.obs;
  // var selectedFreeDevSat = 'Gather'.obs;
  var check = false.obs;
  var newsNot = false.obs;
  var pushNot = false.obs;
  var clrChalNotAlm = false.obs;
  var pauseChalNotAlm = false.obs;
  var screenMode = true.obs;

  var _selectedFreeDev1 = 'Tech'.obs;
  var _selectedBaseLev1 = '6-8'.obs;
  String get selectedBaseLev1 => _selectedBaseLev1.value;
  String get selectedFreeDev1 => _selectedFreeDev1.value;
  var _warmupCheck = false.obs;
  bool get warmupCheck => _warmupCheck.value;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _warmupCheck.value = prefs.getBool('warmupCheck');
    check = _warmupCheck ?? false;

    _selectedFreeDev1.value = prefs.getString('selectedFreeDev');
    _selectedBaseLev1.value = prefs.getString('selectedBaseLev');
    selectedFreeDev = _selectedFreeDev1 ?? 'Tech';
    // selectedBaseLev = _selectedBaseLev1 ?? '6-8';
    super.onInit();
  }

  void onBaseLevChanged(value) async {
    selectedBaseLev.value = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedBaseLev', selectedBaseLev.value);
  }

  void onFreeDevChanged(value) async {
    selectedFreeDev.value = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedFreeDev', selectedFreeDev.value);
  }

  // void onFreeDevSatChanged(value) {
  //   selectedFreeDevSat.value = value;
  // }

  void checkVisible() async {
    check.value = !check.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('warmupCheck', check.value);
  }

  void checkVisibleNewsNot() {
    newsNot.value = !newsNot.value;
  }

  void checkVisiblePushNot() {
    pushNot.value = !pushNot.value;
  }

  void checkVisibleClrChalNotAlm() {
    clrChalNotAlm.value = !clrChalNotAlm.value;
  }

  void checkVisiblePauseChalNotAlm() {
    pauseChalNotAlm.value = !pauseChalNotAlm.value;
  }

  void checkVisibleScreenMode() {
    screenMode.value = !screenMode.value;
  }
}
