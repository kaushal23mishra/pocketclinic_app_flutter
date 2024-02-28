import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/widget/text_widget.dart';

import 'common_color.dart';

class CommonHeading extends StatefulWidget {
  final String heading;

  const CommonHeading({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  State<CommonHeading> createState() => _CommonHeadingState();
}

class _CommonHeadingState extends State<CommonHeading> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12 * fem),
      alignment: Alignment.centerLeft,
      child: DisplayText(
        text: widget.heading,
        fontSize: 32 * fem,
        fontWeight: FontWeight.w700,
        color: CommonColor.deepGreen,
      ),
    );
  }
}

class CategoryText extends StatelessWidget {
  final String text;
  final FontWeight myFont;
  final int color;

  const CategoryText({
    Key? key,
    required this.text,
    required this.myFont,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20 * fem,
        fontWeight: myFont,
        color: Color(color),
      ),
    );
  }
}
