import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/responsive.dart';
class CustomRichText extends StatefulWidget {
  const CustomRichText({super.key});

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}
class _CustomRichTextState extends State<CustomRichText> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: Responsive.isMobile(context)==true?20*fem:  16 * fem,
          fontWeight: FontWeight.w400,
          height: 1.5 * ffem / fem,
          color: const Color(0xff585858),
        ),
        children: [
          const TextSpan(
            text: 'Don’t have an account ?   ',
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(
              fontSize: Responsive.isMobile(context)==true?20*fem:  16 * fem,
              fontWeight: FontWeight.w400,
              height: 1.5 * ffem / fem,
              decoration: TextDecoration.underline,
              color: const Color(0xff481ee5),
              decorationColor: const Color(0xff481ee5),
            ),
          ),
        ],
      ),
    );
  }
}