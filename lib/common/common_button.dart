import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/widget/text_widget.dart';

import 'common_color.dart';
import 'common_string.dart';

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomContainer({
    required this.imagePath,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);

    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19 * fem, 0 * fem),
      padding: EdgeInsets.fromLTRB(32.5 * fem, 11 * fem, 28.5 * fem, 11 * fem),
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.primary),
        borderRadius: BorderRadius.circular(6 * fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14 * fem, 0 * fem),
            width: 16 * fem,
            height: 20 * fem,
            child: Image.asset(
              imagePath,
              width: 16 * fem,
              height: 20 * fem,
            ),
          ),
          DisplayText(
            text: text,
            fontSize: 16 * fem,
            color: CommonColor.primary,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      width: double.infinity,
      height: 80 * fem,
      decoration: BoxDecoration(
        color: CommonColor.primary,
        borderRadius: BorderRadius.circular(12 * fem),
      ),
      child: Center(
        child: DisplayText(
          text: CommonString.logIn,
          fontSize: 24 * fem,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.48 * fem,
          color: CommonColor.whiteColor,
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final bool isSelected;
  final bool changeChildWidget;
  final Function() onFunctionCallBack;
  final Function() onEndFunctionCallBack;
  final String buttonTitle;
  final double buttonTitleSize;
  final Color titleColor;
  final FontWeight titleWeight;
  const AnimatedButton(
      {super.key,
      required this.isSelected,
      required this.changeChildWidget,
      required this.onFunctionCallBack,
      required this.onEndFunctionCallBack,
      required this.buttonTitle,
      required this.buttonTitleSize,
      required this.titleColor,
      required this.titleWeight});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: isSelected ? 70 : Get.width,
        onEnd: onEndFunctionCallBack,
        duration: const Duration(seconds: 50),
        child: MaterialButton(
          onPressed: onFunctionCallBack,
          minWidth: Get.width,
          color: CommonColor.primary,
          shape: changeChildWidget
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: changeChildWidget ? 10.0 : 18.0),
            child: changeChildWidget
                ? const CircularProgressIndicator(
                    color: CommonColor.whiteColor,
                  )
                : FittedBox(
                    child: DisplayText(
                        text: buttonTitle,
                        fontSize: buttonTitleSize,
                        color: titleColor,
                        fontWeight: titleWeight),
                  ),
          ),
        ));
  }
}
