import 'dart:convert';
import 'package:get/get.dart';
import '../common/api_services/api_client.dart';
import '../common/api_services/api_end_points.dart';
import 'package:http/http.dart' as http;

import '../models/condition_model.dart';

// I haven't added a try-catch block here because I've already handled each aspect in the API services class.
class ConditionControllers extends GetxController {
  // Observable to hold condition data
  final conditionData = ConditionModel().obs;

  // Observable list to hold final condition data
  final conditionFinalData = <Data>[].obs;

  // Function to call the condition API
  Future<dynamic> callConditionApi() async {
    // Construct the URL for the condition endpoint
    String url = ApiEndPoints.conditionEndPoint;

    // Call the API using ApiClient
    await ApiClient.callGetApi(
      url,
      onResponse: (http.Response response) async {
        // Parse the response body into a ConditionModel object
        conditionData.value =
            ConditionModel.fromJson(jsonDecode(response.body));

        // Extract the data field from the ConditionModel and assign it to conditionFinalData
        conditionFinalData.value = conditionData.value.data!;
      },
    );
  }
}
