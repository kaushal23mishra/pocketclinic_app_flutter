import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/card_constant.dart';
import '../../common/heading_constant.dart';
import '../../common/responsive.dart';
import '../../common/timeline_detail/other_card.dart';
import '../../common/timeline_detail/timeline_detail.dart';
import '../../common/your_task_container.dart';
import '../../controllers/drawer_controller.dart';
import '../../controllers/visit_controller.dart';

class TimelineSubScreen extends StatefulWidget {
  const TimelineSubScreen({super.key});

  @override
  State<TimelineSubScreen> createState() => _TimelineSubScreenState();
}

class _TimelineSubScreenState extends State<TimelineSubScreen> {
  List<Widget> screens = [
    const MainCard(),
    const MainCard(),
    const MainCard(),
    const MainCard(),
    const MainCard(),
    const MainCard(),
    const MainCard(),
  ];
  final visitCategoryController = Get.put(VisitCategoryController());
  final _visitControllers = Get.put(VisitControllers());
  @override
  void initState() {
    _visitControllers.callVisitApi();
    super.initState();
  }

  @override
  void dispose() {
    // Get.delete<VisitControllers>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Padding(
      padding: EdgeInsets.only(top: 20 * fem, left: 30 * fem),
      child: Column(
        children: [
          const CommonHeading(heading: 'Your Task'),
          const YourContainer(),
          const CommonHeading(heading: 'Visits'),
          const CommonCategoryCard(),
          Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: screens[visitCategoryController.currentIndex.value],
            ),
          ),
          const OtherCard(),
          SizedBox(
            height: 24 * fem,
          )
        ],
      ),
    );
  }
}
