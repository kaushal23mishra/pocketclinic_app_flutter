import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import material.dart for GlobalKey
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../common/button_constant.dart';
import '../../common/custom_rich_text.dart';
import '../../common/responsive.dart';
import '../../common/utils/utils.dart';
import '../../controllers/login_controller.dart';
import '../../widget/input_widget.dart';
import '../../widget/snack_bar_widget.dart';
import '../../widget/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginScreenControllers = Get.put(LoginScreenControllers());

  // Define a GlobalKey<FormState>

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /
        (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Container(
      padding: EdgeInsets.fromLTRB(50 * fem, 53 * fem, 50 * fem, 33 * fem),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * fem),
          bottomLeft: Radius.circular(20 * fem),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 34.0*fem),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/logo.png',
              width: 120 * fem,
              height: 52 * fem,
              alignment: Alignment.topRight,
            ),
          ),
          Responsive.isMobile(context)==true?  SizedBox(height: 24.0*fem):SizedBox(height: 14.0*fem),

          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 72 * fem),
            child: DisplayText(
              text: 'Log In',
              fontSize: 32 * ffem,
              letterSpacing: 0.64 * fem,
              textColor: const Color(0xff012622),
            ),
          ),
          // Wrap your Form widget with Form widget and assign the key
          Form(
            key: loginScreenControllers.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomInput(
                  fontSize: Responsive.isMobile(context)==true?25 * fem :20 * fem,
                  controller: loginScreenControllers.usernameController,
                  // keyboardType: TextInputType.emailAddress,
                  // onSaved: (String? value) {},
                  // onChanged: (String? value) {},
                  validation: (String? emailValue) {
                    if (emailValue == null || emailValue.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!GetUtils.isEmail(emailValue)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  topLabel: "Email", label: '',
                  // hintText: "Enter E-mail", label: '',
                ),
                const SizedBox(height: 8.0),

                CustomInput(
                  fontSize: Responsive.isMobile(context)==true?25 * fem :20 * fem,
                  controller: loginScreenControllers.passwordController,
                  topLabel: "Password",
                  // obscureText: true,
                  hint: "*********",
                  onSaved: (String? uPassword) {},
                  onChanged: (String? value) {},
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add any additional password validation logic here if needed
                    return null;
                  },
                  label: '',
                ),
                 SizedBox(height: 24.0*fem),

              ],
            ),
          ),
          SizedBox(height: 24 * fem),
          Container(alignment: Alignment.centerRight,
            child: DisplayText(

              text: 'Forgot password?',
              fontSize:Responsive.isMobile(context)==true?20*fem:  16 * fem,
              fontWeight: FontWeight.w400,
              textDecoration: TextDecoration.underline,
              textColor: const Color(0xff481ee5),
              decorationColor: const Color(0xff481ee5),
            ),
          ),
          const Spacer(),
          const CustomRichText(),
          SizedBox(height: 30 * fem),
          GestureDetector(
            onTap: () async {
              // Validate the form
              if (loginScreenControllers.formKey.currentState!.validate()) {
                // Save the form fields
                loginScreenControllers.formKey.currentState!.save();

                // Call your login function
                await loginScreenControllers.callLoginApi(
                  context: context,
                  username:
                  loginScreenControllers.usernameController.text.trim(),
                  password:
                  loginScreenControllers.passwordController.text,
                );
              }
            },
            child: const CustomButton(),
          ),
          SizedBox(height: 20 * fem),
        ],
      ),
    );
  }
}
