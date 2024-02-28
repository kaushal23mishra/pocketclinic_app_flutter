import 'package:flutter/material.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/widget/text_widget.dart';

import 'common_color.dart';
import 'common_image.dart';

class CommonText extends StatefulWidget {
  final String? image;
  final String? name;
  final String? designation;
  final double? fontSize;
  final double? imageHeight;

  const CommonText(
      {Key? key,
      this.image,
      this.name,
      this.designation,
      this.fontSize,
      this.imageHeight})
      : super(key: key);

  @override
  State<CommonText> createState() => _CommonTextState();
}

class _CommonTextState extends State<CommonText> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
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
              fontSize: widget.fontSize ?? 20 * fem,
              fontWeight: FontWeight.w500,
              color: CommonColor.primary,
            ),
          ),
          if (widget.designation != null) SizedBox(width: 8 * fem),
          if (widget.designation != null)
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
              width: widget.fontSize != null ? 3 * fem : 6 * fem,
              height: widget.fontSize != null ? 3 * fem : 6 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3 * fem),
                color: CommonColor.primary,
              ),
            ),
          if (widget.designation != null)
            Text(
              widget.designation!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: widget.fontSize ?? 20 * fem,
                fontWeight: FontWeight.w500,
                color: CommonColor.primary,
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
  const CommonTextState(
      {Key? key,
      this.title,
      this.content,
      this.textColor,
      this.textFont,
      this.textSize})
      : super(key: key);

  @override
  State<CommonTextState> createState() => _CommonTextStateState();
}

class _CommonTextStateState extends State<CommonTextState> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.only(bottom: 24 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10 * fem),
            child: DisplayText(
              text: widget.title!,
              fontSize: widget.textSize ?? 20 * fem,
              fontWeight: widget.textFont ?? FontWeight.w500,
              color: widget.textColor ?? CommonColor.primary,
            ),
          ),
          SimpleText(content: widget.content)
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 12.25 * fem, 0 * fem),
          child: DisplayText(
              text: widget.text!,
              fontSize: 24 * fem,
              fontWeight: FontWeight.w600,
              color: CommonColor.deepGreen),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4 * fem),
          width: 17.5 * fem,
          height: 17.5 * fem,
          child: Image.asset(
            widget.image!,
            width: 17.5 * fem,
            height: 17.5 * fem,
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      constraints: BoxConstraints(
          maxWidth: (Responsive.isMobile(context) ? 700 * fem : 488 * fem)),
      child: DisplayText(
        text: widget.content!,
        fontSize: 16 * fem,
        fontWeight: FontWeight.w400,
        color: CommonColor.grey600,
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return DisplayText(
      text: widget.text!,
      fontSize: 24 * fem,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.92 * fem,
      color: CommonColor.whiteColor,
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 14 * fem),
      child: DisplayText(
        text: widget.content!,
        fontSize: 32 * fem,
        fontWeight: FontWeight.w600,
        color: CommonColor.deepGreen,
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
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 12 * fem, 0 * fem),
      width: 254 * fem,
      height: 30 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 27.75 * fem, 0 * fem),
            child: DisplayText(
              text: '2 known Conditions',
              fontSize: 20 * fem,
              fontWeight: FontWeight.w500,
              color: CommonColor.deepGreen,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 1.5 * fem, 0 * fem, 0 * fem),
            width: 6.25 * fem,
            height: 12.5 * fem,
            child: Image.asset(
              CommonImage.right,
              width: 6.25 * fem,
              height: 12.5 * fem,
            ),
          ),
        ],
      ),
    );
  }
}
