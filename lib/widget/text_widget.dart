import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/common_fonts.dart';
import '../common/utils/responsive_utils.dart';

class DisplayText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? align;
  final TextDecoration? decoration;
  final String? fontFamily;
  final Color? decorationColor;
  final int? maxLines;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  const DisplayText({
    Key? key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.overflow,
    this.align,
    this.decoration,
    this.decorationColor,
    this.fontFamily,
    this.maxLines,
    this.height,
    this.letterSpacing,
    this.backgroundColor,
    this.fontStyle,
    this.wordSpacing,
    this.textBaseline,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.decorationStyle,
    this.decorationThickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    double ffem = fem * 0.97;

    try {
      return Text(
        text ?? "",
        overflow: overflow,
        textAlign: align,
        maxLines: maxLines,
        // textDirection:TextDecoration.lineThrough,
        // locale:
        // softWrap:true,
        // strutStyle:
        // textScaleFactor:
        // maxLines:
        // semanticsLabel:
        // textWidthBasis:
        // textHeightBehavior:
        // selectionColor:

        style: TextStyle(
          decoration: decoration,
          decorationColor: decorationColor,
          height: height ?? 1.5 * ffem / fem,
          letterSpacing: letterSpacing ?? 0.2 * fem,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
          fontSize: fontSize ?? 14.0 * fem,
          fontFamily: fontFamily ?? AllFontFamilies.poppins,
          backgroundColor: backgroundColor,
          fontStyle: fontStyle,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error while building text widget: $e");
      }
      return const Text(
        "Error",
        style: TextStyle(color: Colors.red),
      );
    }
  }
}

TextStyle commonTextStyle({
  required BuildContext context,
  TextDecoration? decoration,
  Color? decorationColor,
  double? height,
  double? letterSpacing,
  FontWeight? fontWeight,
  Color? color,
  double? fontSize,
  String? fontFamily,
  Color? backgroundColor,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextBaseline? textBaseline,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  //fem is used for relative size
  double fem = SizeUtils.calculateSize1(context);
  double ffem = fem * 0.97;
  return TextStyle(
    decoration: decoration,
    decorationColor: decorationColor,
    height: 1.5 * ffem / fem,
    letterSpacing: letterSpacing ?? 0.2,
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color,
    fontSize: fontSize ?? 14.0 * fem,
    fontFamily: fontFamily ?? AllFontFamilies.poppins,
    backgroundColor: backgroundColor,
    fontStyle: fontStyle,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
  );
}
