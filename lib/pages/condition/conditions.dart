import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/drawer_constant.dart';
import '../../common/responsive.dart';
import '../../controllers/drawer_controller.dart';
import 'condition_sub_page/condition_sub_page_first.dart';

class ConditionScreen extends StatefulWidget {
  const ConditionScreen({super.key});

  @override
  State<ConditionScreen> createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {
  final subDrawerController = Get.put(SubDrawerController());
  List<Widget> screens = [
    const ConditionSubPageFirst(),
    const ConditionSubPageFirst(),
    const ConditionSubPageFirst(),
    const ConditionSubPageFirst(),
    const ConditionSubPageFirst(),
    const ConditionSubPageFirst(),
    const ConditionSubPageFirst(),
  ];
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isMobile(context) == false)
          const CustomSubNavigationDrawer(),
        SizedBox(
          width: 30 * fem,
        ),
        Expanded(
            child: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: screens[subDrawerController.currentIndex.value],
          ),
        ))
      ],
    );
  }
}
