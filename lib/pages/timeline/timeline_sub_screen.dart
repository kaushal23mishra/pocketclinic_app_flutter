import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/common_card.dart';
import '../../common/common_container.dart';
import '../../common/common_heading.dart';
import '../../common/utils/responsive_utils.dart';
import '../../common/timeline_detail/other_card.dart';
import '../../common/timeline_detail/timeline_detail.dart';
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
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
