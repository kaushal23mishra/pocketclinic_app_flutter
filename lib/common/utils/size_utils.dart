import 'package:flutter/material.dart';

import '../responsive.dart';

// Size size = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize /
//     WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

class SizeUtils {
  static double calculateSize1(BuildContext context) {
    return MediaQuery.of(context).size.width /   (Responsive.isMobile(context) ? 700 : 1512);
  }

  static double calculateSize2(BuildContext context) {
    double fem = calculateSize1(context);
    return fem * 0.97;
  }
}
