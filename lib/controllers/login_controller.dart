import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/string_constant.dart';
import '../common/api_services/api_client.dart';
import '../common/api_services/api_end_points.dart';
import '../common/routes.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/login_model.dart';

class LoginScreenControllers extends GetxController {
  //Text Editing Controllers
  final usernameController = TextEditingController(text: 'abdul@gmail.com');
  final passwordController = TextEditingController(text: '1234');
  final formKey = GlobalKey<FormState>();

  //Observable variables
  final loginData = LoginModel().obs;

  //Api function
  Future<dynamic> callLoginApi({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    prefs!.setString(StringConstant.token, "");

    String url = ApiEndPoints.loginEndPoint;
    final data = {"email": username, "password": password};

    await ApiClient.callPostApi(
      url,
      data,
      onResponse: (http.Response response) async {
        loginData.value = LoginModel.fromJson(jsonDecode(response.body));

        await prefs!.clear();
        await prefs!.setString(StringConstant.token, loginData.value.accessToken!);
        await prefs!.setString(StringConstant.isLoggedIn, "1");
        usernameController.clear();
        Get.offAllNamed(AppRoutes.timelineRoute);

      },
    );
  }
}
