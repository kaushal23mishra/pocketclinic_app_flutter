import 'package:flutter/material.dart';
import 'package:pocketclinic/common/common_string.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/widget/text_widget.dart';
import '../../common/common_color.dart';
import '../../common/common_image.dart';
import 'login_components.dart';

class LoginWebPage extends StatefulWidget {
  const LoginWebPage({Key? key}) : super(key: key);

  @override
  State<LoginWebPage> createState() => _LoginWebPageState();
}

class _LoginWebPageState extends State<LoginWebPage> {
  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Scaffold(
      backgroundColor: CommonColor.primary,
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
                            style: commonTextStyle(
                              fontSize: 40 * fem,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8 * fem,
                              color: CommonColor.whiteColor,
                              context: context,
                            ),
                            children: [
                              TextSpan(
                                text: CommonString.welcome,
                                style: commonTextStyle(
                                  fontSize: 40 * fem,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8 * fem,
                                  color: CommonColor.whiteColor,
                                  context: context,
                                ),
                              ),
                              TextSpan(
                                text: CommonString.helpUsText,
                                style: commonTextStyle(
                                  fontSize: 32 * fem,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.64 * fem,
                                  color: CommonColor.whiteColor,
                                  context: context,
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
                          CommonImage.loginImage,
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
