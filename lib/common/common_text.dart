import 'package:flutter/material.dart';
import 'package:pocketclinic/common/responsive.dart';
import 'package:pocketclinic/common/utils/utils.dart';

class CommonText extends StatefulWidget {
  final String? image;
  final String? name;
  final String? designation;
  final double? fontSize;
  final double? imageHeight;

  const CommonText({Key? key, this.image, this.name, this.designation, this.fontSize, this.imageHeight}) : super(key: key);

  @override
  State<CommonText> createState() => _CommonTextState();
}

class _CommonTextState extends State<CommonText> {

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 12 * fem),
      padding: EdgeInsets.fromLTRB(5 * fem, 2 * fem, 0 * fem, 2 * fem),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 13 * fem, 0 * fem),
            // width: 24 * fem,
            height: widget.imageHeight ?? 24 * fem,
            child: Image.asset(
              widget.image!,

            ),
          ),
          Text(
            widget.name!,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: widget.fontSize ?? 20 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.5 * ffem / fem,
              color: const Color(0xff1a8d8d),
            ),
          ),
          if (widget.designation != null) SizedBox(width: 8 * fem),
          if (widget.designation != null)
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
              width:widget.fontSize !=null ? 3 * fem:6 * fem,
              height:widget.fontSize !=null ? 3 * fem:6 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3 * fem),
                color: const Color(0xff1a8d8d),
              ),
            ),
          if (widget.designation != null)
            Text(
              widget.designation!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize:widget.fontSize ?? 20 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.5 * ffem / fem,
                color: const Color(0xff1a8d8d),
              ),
            ),
        ],
      ),
    );
  }
}
class CommonTextState extends StatefulWidget {
  final String? title;
  final String? content;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textFont;
  const CommonTextState({Key? key, this.title, this.content, this.textColor, this.textFont, this.textSize}) : super(key: key);

  @override
  State<CommonTextState> createState() => _CommonTextStateState();
}

class _CommonTextStateState extends State<CommonTextState> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return  Container(
      margin: EdgeInsets.only(bottom: 24 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10 * fem),
            child: Text(
              widget.title!,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: widget.textSize ??20 * ffem,
                fontWeight: widget.textFont ?? FontWeight.w500,
                height: 1.5 * ffem / fem,
                color: widget.textColor ?? const Color(0xff1a8d8d),
              ),
            ),
          ),
           SimpleText(content:widget.content)
        ],
      ),
    );
  }
}
class SmallHeading extends StatefulWidget {
  final String? text;
  final String? image;
  const SmallHeading({super.key, this.text, this.image});

  @override
  State<SmallHeading> createState() => _SmallHeadingState();
}

class _SmallHeadingState extends State<SmallHeading> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.25*fem, 0*fem),
          child: Text(
            widget.text!,
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 24*ffem,
              fontWeight: FontWeight.w600,
              height: 1.5*ffem/fem,
              color: const Color(0xff012622),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
          width: 17.5*fem,
          height: 17.5*fem,
          child: Image.asset(
            widget.image!,
            // 'assets/images/codicon-sparkle-filled.png',
            width: 17.5*fem,
            height: 17.5*fem,
          ),
        ),
      ],
    );
  }
}

class SimpleText extends StatefulWidget {
  final String? content;
  const SimpleText({super.key, this.content});

  @override
  State<SimpleText> createState() => _SimpleTextState();
}

class _SimpleTextState extends State<SimpleText> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return  Container(
      constraints: BoxConstraints(maxWidth:(Responsive.isMobile(context) ? 700* fem : 488 * fem) ),
      child: Text(
        widget.content!,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 16 * ffem,
          fontWeight: FontWeight.w400,
          height: 1.25 * ffem / fem,
          color: const Color(0xff585858),
        ),
      ),
    );
  }
}
class ListTileText extends StatefulWidget {
  final String? text;
  const ListTileText({super.key, this.text});

  @override
  State<ListTileText> createState() => _ListTileTextState();
}

class _ListTileTextState extends State<ListTileText> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return   Text(
      widget.text!,
      style: SafeGoogleFont (
        'Poppins',
        fontSize: 24*ffem,
        fontWeight: FontWeight.w700,
        height: 1.5*ffem/fem,
        letterSpacing: 1.92*fem,
        color: const Color(0xffffffff),
      ),
    );
  }
}

class SimpleHeadingText extends StatefulWidget {
  final String? content;
  const SimpleHeadingText({super.key, this.content});

  @override
  State<SimpleHeadingText> createState() => _SimpleHeadingTextState();
}

class _SimpleHeadingTextState extends State<SimpleHeadingText> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
      child: Text(
        widget.content!,
        style: SafeGoogleFont (
          'Poppins',
          fontSize: 32*ffem,
          fontWeight: FontWeight.w600,
          height: 1.5*ffem/fem,
          color: const Color(0xff012622),
        ),
      ),
    );
  }
}

class SmallHeadingText extends StatefulWidget {
  const SmallHeadingText({super.key});

  @override
  State<SmallHeadingText> createState() => _SmallHeadingTextState();
}

class _SmallHeadingTextState extends State<SmallHeadingText> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 0*fem),
      width: 254*fem,
      height: 30*fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 27.75*fem, 0*fem),
            child: Text(
              '2 known Conditions',
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 20*ffem,
                fontWeight: FontWeight.w500,
                height: 1.5*ffem/fem,
                color: const Color(0xff012622),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 1.5*fem, 0*fem, 0*fem),
            width: 6.25*fem,
            height: 12.5*fem,
            child: Image.asset(
              'assets/images/iconamoon-arrow-up-2-light-EwR.png',
              width: 6.25*fem,
              height: 12.5*fem,
            ),
          ),
        ],
      ),
    );
  }
}

