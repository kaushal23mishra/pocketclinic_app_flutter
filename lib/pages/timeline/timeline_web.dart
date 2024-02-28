import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/common_color.dart';
import 'package:pocketclinic/common/common_drawer.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/pages/condition/conditions.dart';
import 'package:pocketclinic/pages/timeline/timeline_sub_screen.dart';

import '../../common/common_app_bar.dart';
import '../../controllers/drawer_controller.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Widget> screens = [
    const TimelineSubScreen(),
    const ConditionScreen(),
  ];

  // Create an instance of the private controller to manage sub drawer state
  late final MainDrawerController _mainDrawerController;

  @override
  void initState() {
    // Initialize the controller when the screen initializes
    _mainDrawerController = Get.put(MainDrawerController());

    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the screen is disposed
    _mainDrawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Scaffold(
        bottomNavigationBar: Responsive.isMobile(context) == true
            ? SizedBox(height: 95 * fem, child: PersistenceBottomBar())
            : const SizedBox(),
        appBar: const CommonAppBar(),
        backgroundColor: CommonColor.whiteColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: 0 * fem,
            // top: 7 * fem,
            right: Responsive.isMobile(context) == true ? 25 * fem : 50 * fem,
          ),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isMobile(context) == false)
                  SizedBox(
                      width: 105 * fem,
                      height: 1075 * fem,

                      // Flexible(
                      //     flex: 1,
                      child: CustomNavigationDrawer()),
                // SizedBox(
                //   width: 30 * fem,
                // ),
                Expanded(
                    child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: screens[_mainDrawerController.currentIndex.value],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
