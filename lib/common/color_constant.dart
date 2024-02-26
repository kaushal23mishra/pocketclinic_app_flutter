import 'package:flutter/material.dart';
class ColorConstant {
  static const Color primary = Color(0xff1a8d8d);
  static const Color popUpHighlight = Color(0xffFFF4E6);
  static const Color cardBorderColor = Color(0xffd4e3ff);
  static const Color shadColor = Color(0x3f000000);
  static const Color shadeGray = Color(0xff828282);
  static const Color blackColor = Color(0xff000000);
  static const Color subBlackColor = Color(0xff515151);
  static const Color shadeColor = Color(0x0f000000);
  static const Color primaryAcc = Color(0xffD9D9D9);
  static const Color boxShad = Color(0x05000000);
  // static const Color decorationColor = Color(0xfff3676c);
  static const Color subgray = Color(0xffA6A6A6);
  static const Color secondaryAcc = Color(0xff334257);
  static const Color cardTextColor = Color(0xff505050);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color borderColor = Color(0xffD0DBE9);
  static const Color sonicSilver = Color(0xff7A7A7A);
  static const Color sonicsilveracc = Color(0xff6A6A6A);
  static const Color charlestonGreen = Color(0xff292929);
  static const Color delftBlue = Color(0xff2B3D5F);
  static const Color backgroundColor = Color(0xffE5E5E5);
  static const Color backgroundacc = Color(0xffF8F8F8);
  static const Color quickSilver = Color(0xffA6A6A6);
  static const Color brightRed = Color(0xffEF363D);
  static const Color lightGrayishBlue = Color(0xffE8F0FE);
  static const Color dimGray = Color(0xff6A6A6A);
  static const Color outerSpace = Color(0xff454545);
  static const Color blueColor = Color(0xffF8FAFD);
  static const Color lightSilver = Color(0xffD6D6D6);

  static const Color platinum = Color(0xffE8E8E8);

  static const Color popUpBoxItemDescriptionColor = Color(0xff7A7A7A);
  static const Color grey600 = Color(0xff7A7A7A);

  static const Color orderScreenChipBorderColor = Color(0xff6a6a26);

  static const Color loginScreenForgotPasswordText = Color(0xff334257);
  static const Color forgotPasswordTextColorInLoginScreen = Color(0xff334257);

  static const Color vegImgColor = Color(0xff009444);

  static const Color amountChangeDialogBoxTextFieldBorderColor =
  Color(0xffD0DBE9);

  static const Color neutral50 = Color(0xffF2F2F9);
  static const Color neutral100 = Color(0xffE7E7EE);
  static const Color neutral150 = Color(0xffDDDDF3);
  static const Color neutral200 = Color(0xffD2D2D9);
  static const Color neutral250 = Color(0xffC8C8CE);
  static const Color neutral300 = Color(0xffBdBdC3);
  static const Color neutral350 = Color(0xffB3B3B8);
  static const Color neutral400 = Color(0xffA8A8AE);
  static const Color neutral450 = Color(0xff9E9EA3);
  static const Color neutral500 = Color(0xff6E6E72);
  static const Color neutral550 = Color(0xff646467);
  static const Color neutral600 = Color(0xff59595D);
  static const Color neutral650 = Color(0xff4F4F52);
  static const Color neutral700 = Color(0xff444447);
  static const Color neutral750 = Color(0xff3A3A3C);
  static const Color neutral800 = Color(0xff2F2F32);
  static const Color neutral850 = Color(0xff252527);
  static const Color neutral900 = Color(0xff1A1A1C);
  static const Color neutral950 = Color(0xff101010);

  static const Color red700 = Color(0xffC9252D);
  static const Color red600 = Color(0xffD7373F);
  static const Color red500 = Color(0xffE34850);
  static const Color red400 = Color(0xffEC5B62);
  static const Color red300 = Color(0xffF76D74);

  static const Color yellow700 = Color(0xffCB6F10);
  static const Color yellow600 = Color(0xffDA7B11);
  static const Color yellow500 = Color(0xffE68619);
  static const Color yellow400 = Color(0xffF29423);
  static const Color yellow300 = Color(0xffF9A43F);

  static const Color green700 = Color(0xff12805C);
  static const Color green600 = Color(0xff268E6C);
  static const Color green500 = Color(0xff2D9D78);
  static const Color green400 = Color(0xff33AB84);
  static const Color green300 = Color(0xff39B990);

  // static const Color orange = Color(0xffEE6240);
  static const Map<int, Color> color = {
    50: Color.fromRGBO(28, 122, 219, .1),
    100: Color.fromRGBO(28, 122, 219, .2),
    200: Color.fromRGBO(28, 122, 219, .3),
    300: Color.fromRGBO(28, 122, 219, .4),
    400: Color.fromRGBO(28, 122, 219, .5),
    500: Color.fromRGBO(28, 122, 219, .6),
    600: Color.fromRGBO(28, 122, 219, .7),
    700: Color.fromRGBO(28, 122, 219, .8),
    800: Color.fromRGBO(28, 122, 219, .9),
    900: Color.fromRGBO(28, 122, 219, 1),
  };
  static final List<Color> customSubNavigationDrawerBackgroundColor = [
    Colors.blue,
    Colors.red,
    Color(0xffec94be),
    Color(0xffa2d8f4),
    Color(0xffa2d8f4),
    Color(0xfff6b336),
    Color(0xfff6b336),
  ];

  static const primarySwatch = MaterialColor(0xff1C7ADB, color);

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: primaryAcc));

  static final OutlineInputBorder focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: primarySwatch, width: 2));

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 2));
}
