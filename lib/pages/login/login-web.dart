import 'package:flutter/material.dart';

import '../../common/responsive.dart';
import 'login_components.dart';

class LoginWebPage extends StatefulWidget {
  const LoginWebPage({Key? key}) : super(key: key);

  @override
  State<LoginWebPage> createState() => _LoginWebPageState();
}

class _LoginWebPageState extends State<LoginWebPage> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: const Color(0xff1a8d8d),
      body: Responsive.isMobile(context)
          ? const LoginPage()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            114 * fem, 115 * fem, 208 * fem, 0),
                        constraints: BoxConstraints(
                          maxWidth: 557 * fem,
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 40 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.4099999428 * ffem / fem,
                              letterSpacing: 0.8 * fem,
                              color: const Color(0xffffffff),
                            ),
                            children: [
                              TextSpan(
                                text: 'Welcome \n',
                                style: TextStyle(
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.4099999428 * ffem / fem,
                                  letterSpacing: 0.8 * fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                              TextSpan(
                                text: 'Help us create your health report ',
                                style: TextStyle(
                                  fontSize: 32 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4099999666 * ffem / fem,
                                  letterSpacing: 0.64 * fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 702.69 * fem,
                        ),
                        child: Image.asset(
                          'assets/images/login_image.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: LoginPage()),
              ],
            ),
    );
  }
}
