import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../common/font_constent.dart';


class DisplayText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final Color? decorationColor;
  final int? maxLines;
  final double? height;
  final double? letterSpacing;
  final TextStyle? textStyle;
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
    this.textColor,
    this.overflow,
    this.textAlign,
    this.textDecoration,
    this.decorationColor,
    this.fontFamily,
    this.maxLines,
    this.height,
    this.letterSpacing,
    this.textStyle,
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
    double baseWidth = 1512;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    try {
      return Text(
        text ?? "",
        overflow: overflow,
        textAlign: textAlign,
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
          decoration: textDecoration,
          decorationColor: decorationColor,
          height: height ?? 1.5 * ffem / fem,
          letterSpacing: letterSpacing ?? 0.2 * fem,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor,
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
