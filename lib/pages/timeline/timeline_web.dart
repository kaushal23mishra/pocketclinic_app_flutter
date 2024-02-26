import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/pages/timeline/timeline_sub_screen.dart';

import '../../common/color_constant.dart';
import '../../common/image_constant.dart';
import '../../common/drawer_constant.dart';
import '../../common/responsive.dart';
import '../../controllers/drawer_controller.dart';
import '../../widget/image_widget.dart';
import '../condition/conditions.dart';

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
  final mainDrawerController = Get.put(MainDrawerController());
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    return Scaffold(
        bottomNavigationBar: Responsive.isMobile(context) == true
            ? SizedBox(height: 95 * fem, child: PersistenceBottomBar())
            : const SizedBox(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 250 * fem,
          leading: Image.asset(
            'assets/images/logo.png',
            scale: 4,
          ),
          iconTheme: const IconThemeData(color: ColorConstant.sonicsilveracc),
          backgroundColor: ColorConstant.whiteColor,
          elevation: 3,
          actions: [
            const Spacer(),
            CustomImageView(
              svgPath: ImageConstant.notificationBell,
              // width: 60 *fem,
              color: ColorConstant.primary,
            ),
            SizedBox(
              width: 30 * fem,
            ),

            // GestureDetector(
            //   onTap: () {
            //     mainScreenControllers.currentIndex.value = 5;
            //   },
            //   child: Row(
            //     children: [
            //       Container(
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               border: Border.all(
            //                   width: 0.5.w,
            //                   color: ColorConstants.primary)),
            //           child: CircleAvatar(
            //             radius: 20.r,
            //             backgroundImage:
            //                 const AssetImage(ImageConstants.profile),
            //           )),
            //     ],
            //   ),
            // ),
            PopupMenuButton(
                padding: const EdgeInsets.all(5),
                offset: const Offset(0, 50),
                constraints: const BoxConstraints(
                  minWidth: 100.0,
                  maxWidth: 150.0,
                ),
                icon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 0.5, color: ColorConstant.primary)),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    )),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "Profile",
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/timeline.png',
                              scale: 2,
                            ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            const Text("My Profile"),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: "Logout",
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/timeline.png',
                              scale: 2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Logout"),
                          ],
                        ),
                      ),
                    ],
                onSelected: (value) {
                  // if (value == "Profile") {
                  //   mainScreenControllers.currentIndex.value = 5;
                  // } else {
                  //   Get.offAllNamed(RouteConstant.loginScreen);
                  // }
                }),
            SizedBox(
              width: Get.width / 19,
            ),
          ],
        ),
        backgroundColor: const Color(0xffffffff),
        body: Padding(
          padding: EdgeInsets.only(
            left: 0 * fem,
            // top: 7 * fem,
            right:Responsive.isMobile(context)==true?  25 * fem:50*fem,
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
                    child: screens[mainDrawerController.currentIndex.value],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
