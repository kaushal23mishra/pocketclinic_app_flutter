import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/utils/responsive_utils.dart';
import 'common/utils/routes_utils.dart';

// SharedPreferences instance to store user data
SharedPreferences? prefs;

// Variable to track user login status
late final String? isLoggedIn;

void main() async {
  // Run the application
  runApp(const MyApp());

  // Initialize SharedPreferences
  prefs = await SharedPreferences.getInstance();
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return the GetMaterialApp widget which initializes the application
    return GetMaterialApp(
      // Application title
      title: "Pocket Clinic",

      // Disable the debug banner in the app
      debugShowCheckedModeBanner: false,

      // Custom scroll behavior defined in MyCustomScrollBehavior
      scrollBehavior: MyCustomScrollBehavior(),

      // Initial route based on user login status
      initialRoute: isLoggedIn == null
          ? AppRoutes.loginRoute
          : isLoggedIn == '1'
              ? AppRoutes.timelineRoute
              : AppRoutes.loginRoute,

      // List of routes/pages defined in AppRoutes
      getPages: AppRoutes.pages,
    );
  }
}
