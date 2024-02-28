import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';

import 'common_color.dart';

class CustomRichText extends StatefulWidget {
  const CustomRichText({super.key});

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: Responsive.isMobile(context) == true ? 20 * fem : 16 * fem,
          fontWeight: FontWeight.w400,
          color: CommonColor.grey600,
        ),
        children: [
          const TextSpan(
            text: 'Don’t have an account ?   ',
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(
              fontSize:
                  Responsive.isMobile(context) == true ? 20 * fem : 16 * fem,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              color: CommonColor.vibrantPurple,
              decorationColor: CommonColor.vibrantPurple,
            ),
          ),
        ],
      ),
    );
  }
}
