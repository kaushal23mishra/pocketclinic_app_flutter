import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/common_drawer.dart';
import 'package:pocketclinic/common/common_search_field.dart';
import 'package:pocketclinic/common/common_tab.dart';
import 'package:pocketclinic/common/common_text.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/controllers/drawer_controller.dart';

class ConditionSubPageFirst extends StatefulWidget {
  const ConditionSubPageFirst({Key? key}) : super(key: key);

  @override
  State<ConditionSubPageFirst> createState() => _ConditionSubPageFirstState();
}

class _ConditionSubPageFirstState extends State<ConditionSubPageFirst> {
  // Create an instance of the private controller to manage sub drawer state
  late final SubDrawerController _subDrawerController;

  @override
  void initState() {
    // Initialize the controller when the screen initializes
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
    const ConditionTab(),
    const ConditionTab(),
    const ConditionTab(),
    const ConditionTab(),
    const ConditionTab(),
  ];

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Spacing based on device type
        SizedBox(height: Responsive.isMobile(context) ? 30 * fem : 43 * fem),
        if (Responsive.isMobile(context)) // Conditional rendering for mobile
          const SizedBox(
            height: 120,
            // width: 400,
            child: ConditionCategories(),
          ),
        // SearchField widget
        const SearchField(),
        SizedBox(
          height: 23 * fem,
        ),
        // Heading text
        const SmallHeadingText(),
        SizedBox(
          height: 23 * fem,
        ),
        // Observe changes in sub drawer index and switch between screens accordingly
        Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: screens[_subDrawerController.currentIndex.value],
            )),
      ],
    );
  }
}
