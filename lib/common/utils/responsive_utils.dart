import 'dart:ui';
import 'package:flutter/material.dart';

/// A custom scroll behavior that allows dragging with touch and mouse.
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

/// A widget that provides responsiveness based on screen size.
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget smallMobile;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.smallMobile,
  }) : super(key: key);

  // This size work fine on my design, maybe you need some customization depends on your design

  /// This function checks if the current context represents a mobile device.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  /// This function checks if the current context represents a tablet device.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500;

  /// This function checks if the current context represents a desktop device.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (size.width >= 1200) {
      return desktop;
    }
    // If width is less than 1200 and more than 768, we consider it as a tablet
    else if (size.width >= 768) {
      return tablet;
    }
    // If width is between 376 and 768, we consider it a mobile
    else if (size.width >= 376 && size.width <= 768) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}

/// A utility class for calculating sizes based on screen width.
class SizeUtils {
  /// Calculates size 1 based on the current context.
  ///
  /// Returns a calculated size value.
  static double calculateSize1(BuildContext context) {
    return MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
  }

  /// Calculates size 2 based on the current context.
  ///
  /// Returns a calculated size value, slightly adjusted from size 1.
  static double calculateSize2(BuildContext context) {
    double fem = calculateSize1(context);
    return fem * 0.97;
  }
}
