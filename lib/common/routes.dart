import 'package:get/get.dart';

import '../pages/login/login-web.dart';
import '../pages/timeline/timeline_web.dart';
class AppRoutes {
  static const String timelineRoute = '/timelineRoute';
  static const String loginRoute = "/loginRoute";

  static List<GetPage> pages = [
    GetPage(
      name: timelineRoute,
      page: () => const TimelinePage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: loginRoute,
      page: () => const LoginWebPage(),
    ),
    // GetPage(
    //   name: RouteConstant.forgotScreen,
    //   page: () => ForgotPasswordScreen(),
    //   transition: Transition.fade,
    // ),
    // GetPage(
    //   name: RouteConstant.forgotPasswordOtpScreen,
    //   page: () => ForgotPassOtpScreen(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(
    //   name: RouteConstant.forgotPasswordLastScreen,
    //   page: () => ForgotPasswordLastScreen(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(name: RouteConstant.mainScreen, page: () => MainScreen()),
    // GetPage(name: RouteConstant.dashboardScreen, page: () => const DashboardScreen())
  ];
}


