import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_color.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.dialog(
          const Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(
                CommonColor.whiteColor,
              ),
            ),
          ),
          barrierDismissible: isCancellable,
        );
      });

      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}
