import 'package:flutter/material.dart'; // Import material.dart for GlobalKey
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pocketclinic/common/common_button.dart';
import 'package:pocketclinic/common/common_rich_text.dart';
import 'package:pocketclinic/common/utils/responsive_utils.dart';
import 'package:pocketclinic/controllers/login_controller.dart';
import 'package:pocketclinic/widget/input_widget.dart';
import 'package:pocketclinic/widget/text_widget.dart';

import '../../common/common_color.dart';
import '../../common/common_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create an instance of the controller to manage sub drawer state
  late final LoginScreenControllers _loginScreenControllers;

  @override
  void initState() {
    // Initialize the private controller when the screen initializes
    _loginScreenControllers = Get.put(LoginScreenControllers());
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the screen is disposed
    _loginScreenControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //fem is used for relative size
    double fem = SizeUtils.calculateSize1(context);
    return Container(
      padding: EdgeInsets.fromLTRB(50 * fem, 53 * fem, 50 * fem, 33 * fem),
      decoration: BoxDecoration(
        color: CommonColor.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * fem),
          bottomLeft: Radius.circular(20 * fem),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 34.0 * fem),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              CommonImage.logo,
              width: 120 * fem,
              height: 52 * fem,
              alignment: Alignment.topRight,
            ),
          ),
          Responsive.isMobile(context) == true
              ? SizedBox(height: 24.0 * fem)
              : SizedBox(height: 14.0 * fem),

          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 72 * fem),
            child: DisplayText(
              text: 'Log In',
              fontSize: 32 * fem,
              letterSpacing: 0.64 * fem,
              color: CommonColor.deepGreen,
            ),
          ),
          // Wrap your Form widget with Form widget and assign the key
          Form(
            key: _loginScreenControllers.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomInput(
                  fontSize: Responsive.isMobile(context) == true
                      ? 25 * fem
                      : 20 * fem,
                  controller: _loginScreenControllers.usernameController,
                  validation: (String? emailValue) {
                    if (emailValue == null || emailValue.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!GetUtils.isEmail(emailValue)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  topLabel: "Email",
                ),
                const SizedBox(height: 8.0),
                CustomInput(
                  fontSize: Responsive.isMobile(context) == true
                      ? 25 * fem
                      : 20 * fem,
                  controller: _loginScreenControllers.passwordController,
                  topLabel: "Password",
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
                ),
                SizedBox(height: 24.0 * fem),
              ],
            ),
          ),
          SizedBox(height: 24 * fem),
          Container(
            alignment: Alignment.centerRight,
            child: DisplayText(
              text: 'Forgot password?',
              fontSize:
                  Responsive.isMobile(context) == true ? 20 * fem : 16 * fem,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              color: CommonColor.vibrantPurple,
              decorationColor: CommonColor.vibrantPurple,
            ),
          ),
          const Spacer(),
          const CustomRichText(),
          SizedBox(height: 30 * fem),
          GestureDetector(
            onTap: () async {
              // Validate the form
              if (_loginScreenControllers.formKey.currentState!.validate()) {
                // Save the form fields
                _loginScreenControllers.formKey.currentState!.save();

                // Call login function
                await _loginScreenControllers.callLoginApi(
                  context: context,
                  username:
                      _loginScreenControllers.usernameController.text.trim(),
                  password: _loginScreenControllers.passwordController.text,
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
