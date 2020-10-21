import 'package:lsshelper/services/auth_service.dart';

import 'package:get/get.dart';

import '../auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.put<AuthController>(AuthController(authService: Get.find()),
        permanent: true);
  }
}
