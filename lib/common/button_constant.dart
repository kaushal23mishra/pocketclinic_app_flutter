import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/responsive.dart';
import 'package:pocketclinic/common/utils/utils.dart';

import '../widget/text_widget.dart';
import 'color_constant.dart';

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
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 19 * fem, 0 * fem),
      padding: EdgeInsets.fromLTRB(32.5 * fem, 11 * fem, 28.5 * fem, 11 * fem),
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff1a8d8d)),
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
          Text(
            text,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 16 * ffem,
              fontWeight: FontWeight.w600,
              height: 1.5 * ffem / fem,
              color: const Color(0xff1a8d8d),
            ),
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
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      height: 80 * fem,
      decoration: BoxDecoration(
        color: const Color(0xff1a8d8d),
        borderRadius: BorderRadius.circular(12 * fem),
      ),
      child: Center(
        child: Text(
          'Log In',
          style: TextStyle(
            fontSize: 24 * ffem,
            fontWeight: FontWeight.w700,
            height: 1.5 * ffem / fem,
            letterSpacing: 0.48 * fem,
            color: const Color(0xffffffff),
          ),
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
          color: ColorConstant.primary,
          shape: changeChildWidget
              ? const CircleBorder()
              : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding:
            EdgeInsets.symmetric(vertical: changeChildWidget ? 10.0 : 18.0),
            child: changeChildWidget
                ? const CircularProgressIndicator(
              color: ColorConstant.whiteColor,
            )
                : FittedBox(
              child: DisplayText(
                  text: buttonTitle,
                  fontSize: buttonTitleSize,
                  textColor: titleColor,
                  fontWeight: titleWeight),
            ),
          ),
        ));
  }
}