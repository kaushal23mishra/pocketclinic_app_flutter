import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/models/visit_model.dart';
import '../common/api_services/api_client.dart';
import '../common/api_services/api_end_points.dart';
import 'package:http/http.dart' as http;

import '../widget/snack_bar_widget.dart';

class VisitControllers extends GetxController {
  final visitData = VisitModel().obs;
  final validatedTasksForUserData = <Data>[].obs;
  final pendingCount = 0.obs;
  final completeCount = 0.obs;

  // final noteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final nonNullUserDataValue = <Map<String, dynamic>>[].obs;
  List<String> taskIds = [];
  Future<dynamic> callVisitApi() async {
    String url = ApiEndPoints.visitEndPoint;

    await ApiClient.callGetApi(
      url,
      onResponse: (http.Response response) async {
        visitData.value = VisitModel.fromJson(jsonDecode(response.body));
        validatedTasksForUserData.value = visitData.value.data!;
        // Clear previous non-null user data value
        nonNullUserDataValue.clear();

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
    String url = ApiEndPoints.updateVisitEndPoint;
    Map<String, String> data = {
    "taskId": visitId,
    "visitId": taskId,
    "note": note

    };
    await ApiClient.callPostApi(
      url,
      data,
      onResponse: (http.Response response) async {


        // noteControllers.clear();
        MyCustomWidgets.successSnackBar(Get.context!, 'Successfully updated');
      },
    );
  }
}
