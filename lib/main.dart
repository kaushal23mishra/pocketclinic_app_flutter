import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/routes.dart';
import 'common/utils/utils.dart';

SharedPreferences? prefs;
var isLoggedIn;
void main() async {
  runApp(const MyApp());
  prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pocket Clinic",
      debugShowCheckedModeBanner: false,

      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: isLoggedIn == null
          ? AppRoutes.loginRoute
          : isLoggedIn == '1'
              ? AppRoutes.timelineRoute
              : AppRoutes.loginRoute,
      getPages: AppRoutes.pages,
    );
  }
}
