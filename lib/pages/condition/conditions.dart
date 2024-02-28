import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/common_drawer.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/controllers/drawer_controller.dart';
import 'condition_sub_page/condition_sub_page_first.dart';

class ConditionScreen extends StatefulWidget {
  const ConditionScreen({Key? key}) : super(key: key);

  @override
  State<ConditionScreen> createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {
  // Create an instance of the controller to manage sub drawer state
  late final SubDrawerController _subDrawerController;

  @override
  void initState() {
    // Initialize the private controller when the screen initializes
    _subDrawerController = Get.put(SubDrawerController());
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the screen is disposed
    _subDrawerController.dispose();
    super.dispose();
  }

  // List of screens to be displayed in the main content area
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // If not on mobile, display custom navigation drawer
        if (!Responsive.isMobile(context)) const CustomSubNavigationDrawer(),
        // Add spacing between drawer and main content
        SizedBox(width: 30 * fem),
        // Main content area
        Expanded(
          child: Obx(
            // Observe changes in sub drawer index and switch between screens accordingly
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: screens[_subDrawerController.currentIndex.value],
            ),
          ),
        ),
      ],
    );
  }
}
