import 'package:flutter/material.dart';
import 'package:pocketclinic/common/common_color.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';

import '../widget/image_widget.dart';
import 'common_image.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;

  final bool? isNotificationTrue;
  final bool? isProfileTrue;
  final bool? isBackTrue;

  const CommonAppBar({
    Key? key,
    this.text,
    this.isBackTrue = true,
    this.isProfileTrue = true,
    this.isNotificationTrue = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 250 * fem,
      leading: Image.asset(
        CommonImage.logo,
        scale: 4,
      ),
      iconTheme: const IconThemeData(color: CommonColor.silver),
      backgroundColor: CommonColor.whiteColor,
      elevation: 3,
      actions: [
        const Spacer(),
        CustomImageView(
          svgPath: CommonImage.notificationBell,
          // width: 60 *fem,
          color: CommonColor.primary,
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
                    border: Border.all(width: 0.5, color: CommonColor.primary)),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(CommonImage.profile),
                )),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: "Profile",
                    child: Row(
                      children: [
                        Image.asset(
                          CommonImage.timelineFilled,
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
                          CommonImage.timelineFilled,
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
      ],
    );
  }
}
