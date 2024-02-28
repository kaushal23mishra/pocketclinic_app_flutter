import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/common_string.dart';
import '../common/api_services/api_client.dart';
import '../common/api_services/api_end_points.dart';
import '../common/utils/routes_utils.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/login_model.dart';

// I haven't added a try-catch block here because I've already handled each aspect in the API services class.
class LoginScreenControllers extends GetxController {
  // Text Editing Controllers
  final usernameController = TextEditingController(text: 'abdul@gmail.com');
  final passwordController = TextEditingController(text: '1234');
  final formKey = GlobalKey<FormState>();

  // Observable variables
  final loginData = LoginModel().obs;

  // API function to call login endpoint
  Future<dynamic> callLoginApi({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    // Clear token from SharedPreferences
    prefs!.setString(CommonString.token, "");

    // Construct the URL for the login endpoint
    String url = ApiEndPoints.loginEndPoint;

    // Prepare data to be sent in the request body
    final data = {"email": username, "password": password};

    // Call the API using ApiClient
    await ApiClient.callPostApi(
      url,
      data,
      onResponse: (http.Response response) async {
        // Parse the response body JSON into a LoginModel object
        loginData.value = LoginModel.fromJson(jsonDecode(response.body));

        // Clear existing data in SharedPreferences
        await prefs!.clear();

        // Store the access token in SharedPreferences
        await prefs!
            .setString(CommonString.token, loginData.value.accessToken!);

        // Set login status to true in SharedPreferences
        await prefs!.setString(CommonString.isLoggedIn, "1");

        // Clear username from text field
        usernameController.clear();
        passwordController.clear();

        // Navigate to timeline screen
        Get.offAllNamed(AppRoutes.timelineRoute);
      },
    );
  }
}
