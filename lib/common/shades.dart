import 'package:flutter/material.dart';

class AllBoxShadows {
  AllBoxShadows._();
  static  BoxShadow menuScreenCartContainerShadow = const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );

  static  BoxShadow menuScreenTopListBoxShadow = const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );

  static  BoxShadow menuScreenGridViewAddButtonShadow = const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );
  static  BoxShadow menuScreenGridViewItemIconShadow = const BoxShadow(
    offset: Offset(5, 5),
    blurRadius: 15,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );

  static const BoxShadow customNavigationDrawerShodow = BoxShadow(
    offset: Offset(2, 2),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );

  static const BoxShadow dashboardScreenContainerShadow = BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 5,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );
}
