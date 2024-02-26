import 'package:flutter/cupertino.dart';
import 'package:pocketclinic/common/responsive.dart';
import 'package:pocketclinic/common/utils/utils.dart';

class SearchFeald extends StatefulWidget {
  const SearchFeald({super.key});

  @override
  State<SearchFeald> createState() => _SearchFealdState();
}

class _SearchFealdState extends State<SearchFeald> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      padding: EdgeInsets.fromLTRB(30*fem, 21*fem, 30*fem, 21*fem),
      width: 907*fem,
      height: 72*fem,
      decoration: BoxDecoration (
        border: Border.all(color: const Color(0xffdedede)),
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(12*fem),
        boxShadow: [
          BoxShadow(
            color: const Color(0x19000000),
            offset: Offset(0*fem, 9*fem),
            blurRadius: 5*fem,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(4.97*fem, 0*fem, 0*fem, 0*fem),
        width: 234*fem,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25.03*fem, 0*fem),
              width: 20*fem,
              height: 20*fem,
              child: Image.asset(
                'assets/images/mynaui-search.png',
                width: 20*fem,
                height: 20*fem,
              ),
            ),
            Text(
              'Search conditions',
              style: SafeGoogleFont (
                'Poppins',
                fontSize: 20*ffem,
                fontWeight: FontWeight.w400,
                height: 1.5*ffem/fem,
                letterSpacing: 0.2*fem,
                color: const Color(0xff585858),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
