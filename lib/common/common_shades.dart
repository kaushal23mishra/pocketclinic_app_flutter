import 'package:flutter/material.dart';
import 'package:pocketclinic/common/common_color.dart';

class AllBoxShadows {
  AllBoxShadows._();
  static BoxShadow menuScreenCartContainerShadow = const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: CommonColor.blackColor,
  );

  static BoxShadow menuScreenTopListBoxShadow = const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: CommonColor.blackColor,
  );

  static BoxShadow menuScreenGridViewAddButtonShadow = const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: CommonColor.blackColor,
  );
  static BoxShadow menuScreenGridViewItemIconShadow = const BoxShadow(
    offset: Offset(5, 5),
    blurRadius: 15,
    color: CommonColor.blackColor,
  );

  static const BoxShadow customNavigationDrawerShadow = BoxShadow(
    offset: Offset(2, 2),
    blurRadius: 12,
    color: CommonColor.blackColor,
  );

  static const BoxShadow dashboardScreenContainerShadow = BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: CommonColor.blackColor,
  );
}
