import 'package:flutter/material.dart';
import '../common/image_constant.dart';
import '../common/utils/size_utils.dart';
import 'image_widget.dart';
import 'text_widget.dart';

class MyCustomWidgets {
  static ScaffoldFeatureController errorSnackBar(BuildContext context, text) {
    double p1 = SizeUtils.calculateSize1(context);
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 20),
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                height: 65 * p1,
                padding: EdgeInsets.only(
                    left: 75 * p1, right: 25 * p1, bottom: 5 * p1),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20 * p1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5 * p1),
                      child: DisplayText(
                        text: 'Oh Snap!',
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15 * p1,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DisplayText(
                      maxLines: 2,
                      text: text,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13 * p1,
                        textColor: Colors.white
                    ),
                  ],
                )),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20 * p1),
                child: CustomImageView(
                  svgPath: ImageConstant.bubblesIcon,
                  width: 60 * p1,
                  color: const Color(0xff801336),
                ),
              ),
            ),
            // theme: const SvgTheme(currentColor: Color(0xff801336)),
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.failIcon,
                    width: 40 * p1,
                    color: const Color(0xff801336),
                  ),
                  Positioned(
                      top: 12 * p1,
                      child: CustomImageView(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        svgPath: ImageConstant.closeIcon,
                        height: 14 * p1,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  static ScaffoldFeatureController successSnackBar(BuildContext context, text) {
    double p1 = SizeUtils.calculateSize1(context);
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 15),
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 65 * p1,
              padding: EdgeInsets.only(
                  left: 75 * p1, right: 25 * p1, bottom: 5 * p1),
              decoration: BoxDecoration(
                  color: const Color(0xff3B7A57),
                  borderRadius: BorderRadius.circular(20 * p1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisplayText(
                    maxLines: 3,
                    text: text,
                    overflow: TextOverflow.ellipsis,
                  textColor: Colors.white,
                    fontSize: 13 * p1,
                    // style: TextStyle(fontSize: 13 * p1, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20 * p1),
                child: CustomImageView(
                  svgPath: ImageConstant.bubblesIcon,
                  width: 60 * p1,
                  color: Colors.green,
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.failIcon,
                    width: 40 * p1,
                    color: Colors.green,
                  ),
                  Positioned(
                      top: 12 * p1,
                      child: CustomImageView(
                        svgPath: ImageConstant.closeIcon,
                        height: 14 * p1,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
