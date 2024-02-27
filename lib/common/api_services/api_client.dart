import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pocketclinic/main.dart';
import '../../widget/snack_bar_widget.dart';
import '../routes.dart';
import '../string_constant.dart';
import '../utils/progress_dialog_utils.dart';
import 'exceptions.dart';

class ApiClient extends GetConnect {
  // Function to make a POST request to the API
  static Future<dynamic> callPostApi(String url, Map data,
      {required Function onResponse,
        bool showLoader = true,
        bool hideLoader = true}) async {
    // Unfocus any focused element
    Get.focusScope!.unfocus();

    // Show progress dialog if requested
    if (showLoader) ProgressDialogUtils.showProgressDialog();

    try {
      // Log request URL and data
      log('request url: $url');
      log('request data: ${json.encode(data)}');

      // Prepare headers with authentication token
      Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs!.getString(StringConstant.token) ?? ""}'
      };
      log('headers: ${json.encode(headers)}');

      // Make POST request
      final http.Response response = await http
          .post(Uri.parse(url), headers: headers, body: json.encode(data))
          .timeout( const Duration(seconds: StringConstant.timeOutDuration));

      // Handle response
      return _returnResponse(response, onResponse, hideLoader);

    } on SocketException catch (_) {
      // Handle no internet connection
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'No Internet Connection');

      ProgressDialogUtils.hideProgressDialog();
      return;
    } on HttpException catch (_) {
      // Handle HTTP exception
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!,
          'Error occurred while Communication with Server with StatusCode : ${_.message}');
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'Something went wrong :$e');
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  // Function to make a GET request to the API
  static Future<dynamic> callGetApi(String url,
      {required Function onResponse,
        bool showLoader = true,
        bool hideLoader = true}) async {
    // Show progress dialog if requested
    if (showLoader) ProgressDialogUtils.showProgressDialog();
    try {
      // Log request URL
      log('request url: $url');

      // Prepare headers with authentication token
      Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs!.getString(StringConstant.token) ?? ""}'
      };
      log('headers: ${json.encode(headers)}');

      // Make GET request
      final http.Response response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: StringConstant.timeOutDuration));

      // Handle response
      return _returnResponse(response, onResponse, hideLoader);

    } on SocketException catch (_) {
      // Handle no internet connection
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'No Internet Connection');

      ProgressDialogUtils.hideProgressDialog();
      return;
    } on HttpException catch (_) {
      // Handle HTTP exception
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!,
          'Error occurred while Communication with Server with StatusCode : ${_.message}');
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'Something went wrong :$e');

      ProgressDialogUtils.hideProgressDialog();
    }
  }

  // Function to make a multipart request to the API
  static Future<dynamic> callMultipartApi(
      String url,
      List<http.MultipartFile> files,
      {required Function onResponse,
        bool showLoader = true,
        bool hideLoader = true}) async {
    // Unfocus any focused element
    Get.focusScope!.unfocus();

    // Show progress dialog if requested
    if (showLoader) ProgressDialogUtils.showProgressDialog();

    var request = http.MultipartRequest("PUT", Uri.parse(url));

    // Prepare headers with authentication token
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs!.getString(StringConstant.token) ?? ""}'
    };

    log('request url: $url');
    log('headers: ${json.encode(headers)}');

    request.headers.addAll(headers);

    try {
      // Add files to the request
      for (http.MultipartFile file in files) {
        request.files.add(file);
        log('request file: ${file.filename}');
      }
    } catch (e) {
      // Handle error adding request
      log("Error adding request : $e");
      ProgressDialogUtils.hideProgressDialog();
    }

    try {
      // Send multipart request
      var response = await request.send();
      return _returnMultiPartResponse(response, onResponse, hideLoader);

    } on SocketException catch (_) {
      // Handle no internet connection
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'No Internet Connection');

      ProgressDialogUtils.hideProgressDialog();
      return;
    } on HttpException catch (_) {
      // Handle HTTP exception
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!,
          'Error occurred while Communication with Server with StatusCode : ${_.message}');
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'Something went wrong :$e');
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  // Function to make a PUT request to the API
  static Future<dynamic> callPutApi(String url, Map data,
      {required Function onResponse,
        bool showLoader = true,
        bool hideLoader = true}) async {
    // Unfocus any focused element
    Get.focusScope!.unfocus();

    // Show progress dialog if requested
    if (showLoader) ProgressDialogUtils.showProgressDialog();
    try {
      // Log request URL and data
      log('request url: $url');
      log('request data: ${json.encode(data)}');

      // Prepare headers with authentication token
      Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs!.getString(StringConstant.token) ?? ""}'
      };
      log('headers: ${json.encode(headers)}');

      // Make PUT request
      final http.Response response = await http
          .put(Uri.parse(url), headers: headers, body: json.encode(data))
          .timeout(const Duration(seconds: StringConstant.timeOutDuration));
      return _returnResponse(response, onResponse, hideLoader);

    } on SocketException catch (_) {
      // Handle no internet connection
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'No Internet Connection');

      ProgressDialogUtils.hideProgressDialog();
      return;
    } on HttpException catch (_) {
      // Handle HTTP exception
      log(_.toString());
      MyCustomWidgets.errorSnackBar(Get.context!,
          'Error occurred while Communication with Server with StatusCode : ${_.message}');
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      MyCustomWidgets.errorSnackBar(Get.context!, 'Something went wrong :$e');
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  // Function to handle response for multipart requests
  static _returnMultiPartResponse(http.StreamedResponse response,
      Function onResponse, bool hideLoader) async {
    log('response code:${response.statusCode}');
    log('response :${response.request}');
    Map responseJson = {};
    try {
      responseJson = jsonDecode(await response.stream.bytesToString());
    } catch (exception) {
      responseJson['message'] = "Something went wrong";
      if (hideLoader) ProgressDialogUtils.hideProgressDialog();

      log(exception.toString());
    }
    switch (response.statusCode) {
      case 200:
        if (hideLoader) ProgressDialogUtils.hideProgressDialog();
        onResponse(response);
        return 'responseJson';
      case 400:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        throw BadRequestException(responseJson.toString());

      case 403:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        prefs!.setString(StringConstant.isLoggedIn, '0');
        Get.offNamedUntil(AppRoutes.loginRoute, (route) => false);
        throw UnauthorisedException(responseJson.toString());

      case 404:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        throw PageNotFoundException(responseJson.toString());

      case 406:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        throw BadRequestException(responseJson.toString());
      case 409:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        break;

      default:
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);

        ProgressDialogUtils.hideProgressDialog();
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  // Function to handle response for regular requests
  static _returnResponse(
      http.Response response, Function onResponse, bool hideLoader) async {
    log('response code:${response.statusCode}');
    log('response :${response.body}');
    Map responseJson = {};
    try {
      responseJson = jsonDecode(response.body);
    } catch (exception) {
      responseJson['message'] = "Something went wrong";
      if (hideLoader) ProgressDialogUtils.hideProgressDialog();

      log(exception.toString());
    }
    switch (response.statusCode) {
      case 200:
        if (hideLoader) ProgressDialogUtils.hideProgressDialog();
        onResponse(response);
        return 'responseJson';
      case 400:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        throw BadRequestException(responseJson['message']);

      case 403:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        prefs!.setString(StringConstant.isLoggedIn, '0');
        Get.offNamedUntil(AppRoutes.loginRoute, (route) => false);
        throw UnauthorisedException(response.body.toString());

      case 404:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        throw PageNotFoundException(response.body.toString());

      case 406:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        throw BadRequestException(response.body.toString());
      case 409:
        ProgressDialogUtils.hideProgressDialog();
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);
        break;
      case 500:
      default:
        MyCustomWidgets.errorSnackBar(Get.context!, responseJson['message']);

        ProgressDialogUtils.hideProgressDialog();
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
