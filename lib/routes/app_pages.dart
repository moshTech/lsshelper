import 'package:lsshelper/controllers/bindings/app_bindings.dart';
import 'package:get/get.dart';
import 'package:lsshelper/screens/dashboard.dart';
import 'package:lsshelper/screens/daily_challenges/daily_challenges_home.dart';
import 'package:lsshelper/screens/login_page.dart';
import 'package:lsshelper/screens/signup_page.dart';
import 'package:lsshelper/screens/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const INITIAL = Routes.SPLASH;
  static const SIGNUP = Routes.SIGNUP;
  static const DASHBOARD = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: DASHBOARD,
      page: () => DashBoard(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: HOME,
      page: () => HomePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: INITIAL,
      page: () => SplashPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: LOGIN,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: SIGNUP,
      page: () => SignupPage(),
    ),
  ];
}
