import 'dart:convert';
import 'package:get/get.dart';
import '../common/api_services/api_client.dart';
import '../common/api_services/api_end_points.dart';
import 'package:http/http.dart' as http;

import '../models/condition_model.dart';

class ConditionControllers extends GetxController {
  final conditionData = ConditionModel().obs;

  final conditionFinalData = <Data>[].obs;

  Future<dynamic> callConditionApi(
  ) async {

    String url = ApiEndPoints.conditionEndPoint;

    await ApiClient.callGetApi(
      url,
      onResponse: (http.Response response) async {
        conditionData.value = ConditionModel.fromJson(jsonDecode(response.body));
        conditionFinalData.value =  conditionData.value.data!;


      },
    );
  }
}
