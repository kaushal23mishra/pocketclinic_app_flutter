import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/responsive.dart';
import 'package:pocketclinic/common/utils/utils.dart';

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
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);

    double ffem = fem * 0.97;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12*fem),
      alignment: Alignment.centerLeft,
      child: Text(
        widget.heading,
        style: SafeGoogleFont(
          'Poppins',
          fontSize:  32 * ffem,
          fontWeight: FontWeight.w700,
          height: 1.5 * ffem / fem,
          color: const Color(0xff012622),
        ),
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
    double fem = MediaQuery.of(context).size.width / (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20 * ffem,
        fontWeight: myFont,
        height: 1.5 * ffem / fem,
        color: Color(color),
      ),
    );
  }
}



