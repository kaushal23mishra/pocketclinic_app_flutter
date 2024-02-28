import 'package:flutter/material.dart';
import 'package:pocketclinic/common/common_image.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import '../common/common_color.dart';
import 'image_widget.dart';
import 'text_widget.dart';

class MyCustomWidgets {
  static ScaffoldFeatureController errorSnackBar(BuildContext context, text) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 20),
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                height: 65 * fem,
                padding: EdgeInsets.only(
                    left: 75 * fem, right: 25 * fem, bottom: 5 * fem),
                decoration: BoxDecoration(
                    color: CommonColor.red600,
                    borderRadius: BorderRadius.circular(20 * fem)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5 * fem),
                      child: DisplayText(
                        text: 'Oh Snap!',
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15 * fem,
                        color: CommonColor.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DisplayText(
                        maxLines: 2,
                        text: text,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13 * fem,
                        color: CommonColor.whiteColor),
                  ],
                )),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20 * fem),
                child: CustomImageView(
                  svgPath: CommonImage.bubblesIcon,
                  width: 60 * fem,
                  color: CommonColor.deepRed,
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
                      svgPath: CommonImage.failIcon,
                      width: 40 * fem,
                      color: CommonColor.deepRed),
                  Positioned(
                      top: 12 * fem,
                      child: CustomImageView(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        svgPath: CommonImage.clock,
                        height: 14 * fem,
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
    double fem = SizeUtils.calculateSize1(context);
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 15),
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 65 * fem,
              padding: EdgeInsets.only(
                  left: 75 * fem, right: 25 * fem, bottom: 5 * fem),
              decoration: BoxDecoration(
                  color: CommonColor.primary,
                  borderRadius: BorderRadius.circular(20 * fem)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisplayText(
                    maxLines: 3,
                    text: text,
                    overflow: TextOverflow.ellipsis,
                    color: CommonColor.whiteColor,
                    fontSize: 13 * fem,
                    // style: TextStyle(fontSize: 13 * fem, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20 * fem),
                child: CustomImageView(
                  svgPath: CommonImage.bubblesIcon,
                  width: 60 * fem,
                  color: CommonColor.lightGreen,
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
                    svgPath: CommonImage.failIcon,
                    width: 40 * fem,
                    color: CommonColor.lightGreen,
                  ),
                  Positioned(
                      top: 12 * fem,
                      child: CustomImageView(
                        svgPath: CommonImage.clock,
                        height: 14 * fem,
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
