import 'package:get/get.dart';

import '../pages/login/login-web.dart';
import '../pages/timeline/timeline_web.dart';

/// Class to manage application routes.
class AppRoutes {
  static const String timelineRoute = '/timelineRoute';
  static const String loginRoute = "/loginRoute";

  /// List of routes/pages in the application.
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
  ];
}
