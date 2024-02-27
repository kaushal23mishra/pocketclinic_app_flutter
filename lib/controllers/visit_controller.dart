import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/models/visit_model.dart';
import '../common/api_services/api_client.dart';
import '../common/api_services/api_end_points.dart';
import 'package:http/http.dart' as http;

import '../widget/snack_bar_widget.dart';

class VisitControllers extends GetxController {
// Observables for visit data and task counts
  final visitData = VisitModel().obs;
  final validatedTasksForUserData = <Data>[].obs;
  final pendingCount = 0.obs;
  final completeCount = 0.obs;

// Form key for form validation
  final formKey = GlobalKey<FormState>();

// List to hold non-null user data values and task ids
  final nonNullUserDataValue = <Map<String, dynamic>>[].obs;
  List<String> taskIds = [];

// Function to call the visit API
  Future<dynamic> callVisitApi() async {
    // Construct the URL for the visit endpoint
    String url = ApiEndPoints.visitEndPoint;

    // Call the API using ApiClient
    await ApiClient.callGetApi(
      url,
      onResponse: (http.Response response) async {
        // Parse the response body JSON into a VisitModel object
        visitData.value = VisitModel.fromJson(jsonDecode(response.body));
        validatedTasksForUserData.value = visitData.value.data!;

        // Clear previous non-null user data value
        nonNullUserDataValue.clear();

        // Iterate over the validated tasks for user data
        for (var data in validatedTasksForUserData.value) {
          if (data.validatedTasksForUser != null && data.validatedTasksForUser!.isNotEmpty) {
            for (var task in data.validatedTasksForUser!) {
              // Create a new map with the _id and task details
              Map<String, dynamic> taskWithId = {
                'id': data.sId,
                'task': task.task,
                'status': task.status,
                'note': task.note
              };
              nonNullUserDataValue.add(taskWithId);
              // Save task id
              taskIds.add(task.id!);
            }
          }
        }
      },
    );
  }


  // Iterate over each data and add only the first object of validatedTasksForUser
  // for (var data in validatedTasksForUserData.value) {
  //   if (data.validatedTasksForUser != null && data.validatedTasksForUser!.isNotEmpty) {
  //     nonNullUserDataValue.add(data.validatedTasksForUser!.first);
  //     znonNullUserDataValue.add(visitData.value.data!.first);
  //   }
  // }
  // nonNullUserDataValue.value = validatedTasksForUserData.value
  //     .where((data) => data.validatedTasksForUser != null)
  //     .expand((data) => data.validatedTasksForUser!)
  //     .toList();

  Future<dynamic> callUpdateVisitApi({
    // required BuildContext context,
    required String visitId,
    required String taskId,
    required String note,
    // required String mobile,
  }) async {
    // Construct the URL for the update visit endpoint
    String url = ApiEndPoints.updateVisitEndPoint;

    // Prepare data to be sent in the request body
    Map<String, String> data = {
      "taskId": visitId,
      "visitId": taskId,
      "note": note
    };

    // Call the API using ApiClient
    await ApiClient.callPostApi(
      url,
      data,
      onResponse: (http.Response response) async {
        // Display success message as a snackbar
        MyCustomWidgets.successSnackBar(Get.context!, 'Successfully updated');
      },
    );
  }

}
