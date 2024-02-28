import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/widget/text_widget.dart';

import 'common_color.dart';
import 'common_image.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      padding: EdgeInsets.fromLTRB(30 * fem, 21 * fem, 30 * fem, 21 * fem),
      width: 907 * fem,
      height: 72 * fem,
      decoration: BoxDecoration(
        border: Border.all(color: CommonColor.grey600),
        color: CommonColor.whiteColor,
        borderRadius: BorderRadius.circular(12 * fem),
        boxShadow: [
          BoxShadow(
            color: CommonColor.blackColor,
            offset: Offset(0 * fem, 9 * fem),
            blurRadius: 5 * fem,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(4.97 * fem, 0 * fem, 0 * fem, 0 * fem),
        width: 234 * fem,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25.03 * fem, 0 * fem),
              width: 20 * fem,
              height: 20 * fem,
              child: Image.asset(
                CommonImage.search,
                width: 20 * fem,
                height: 20 * fem,
              ),
            ),
            DisplayText(
              text: 'Search conditions',
              fontSize: 20 * fem,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2 * fem,
              color: CommonColor.grey600,
            ),
          ],
        ),
      ),
    );
  }
}
