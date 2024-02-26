import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/color_constant.dart';
import '../../common/responsive.dart';

class SimpleInput extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final Color? labelColor;
  final TextInputType inputType;
  final Color? textFieldColor;
  final Color? hintColor;
  final Function()? onChangeCompleted;
  final bool enable;
  final String? Function(String?)? validation;
  final int? maxLength;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final bool? readOnly;
  final double? maxHeight;
  final double? fontSize;
  final Icon? suffixIcon;
  final double? contentPaddingBottom;
  final Function()? onTap;
  final String? helperText;
  final TextAlign? customAlign;
  final Widget? customSuffixIcon;
  final Key? kKey;
  final String? initialValue;
  final String? errorText;
  final String? topLabel;
  final Widget? prefixIcon;

  const SimpleInput({
    Key? key,
    required this.label,
    this.hint = '',
    this.controller,
    this.suffixIcon,
    this.contentPaddingBottom,
    this.hintColor = ColorConstant.green300,
    this.isPassword = false,
    this.labelColor,
    this.textFieldColor,
    this.inputType = TextInputType.text,
    this.onChangeCompleted,
    this.enable = true,
    this.validation,
    this.fontSize,
    this.maxHeight,
    this.maxLength,
    this.onTap,
    this.readOnly,
    this.helperText,
    this.inputFormatters,
    this.autofocus,
    this.customAlign,
    this.customSuffixIcon, this.onSaved, this.onChanged,  this.initialValue, this.kKey, this.errorText, this.prefixIcon, this.topLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width /  (Responsive.isMobile(context) ? 700 : 1512);
    double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.fromLTRB(0 * fem, 4 * fem, 1.5 * fem, 10 * fem),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (label != '')
          //   Padding(
          //     padding: EdgeInsets.only(bottom: 7 * fem),
          //     child: DisplayText(
          //       text: label,
          //       fontSize: 14 * ffem,
          //       textColor: ColorConstant.primary,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          Flexible(

            child: TextFormField(

              // textCapitalization: TextCapitalization.characters,
              textAlign: customAlign ?? TextAlign.left,
              // enabled: enableForm,
              inputFormatters: inputFormatters,
              autofocus: autofocus ?? false,
              maxLength: maxLength,
              enabled: enable,
              obscureText: isPassword,
              onTap: onTap,
              readOnly: readOnly ?? false,
              validator: validation,
              textInputAction: TextInputAction.next,
              //autovalidateMode: Autovalidate  Mode.onUserInteraction,
              keyboardType: inputType,
              style: TextStyle(
                fontSize:fontSize ??  14 * fem,
                // Change the color of the input text here
                color: Colors.black, // Example: Change to blue
              ),
              controller: controller,

              onEditingComplete: onChangeCompleted,
              initialValue: initialValue,
              key: kKey,
              onSaved: onSaved,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding:Responsive.isMobile(context)==true?  EdgeInsets.fromLTRB(
                    20 * fem, 15 * fem, 20.0 * fem, 15.0 * fem):

                EdgeInsets.fromLTRB(
                    10 * fem, 10 * fem, 10.0 * fem, 10.0 * fem),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6 * fem),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: 1 * fem)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6 * fem),
                    borderSide: BorderSide(
                        color: ColorConstant.primarySwatch, width: 1 * fem)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6 * fem),
                    borderSide: BorderSide(
                        color: ColorConstant.red300, width: 1 * fem)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      6 * fem,
                    ),
                    borderSide: BorderSide(
                        color: ColorConstant.primarySwatch, width: 1 * fem)),
                // errorText: error,
                errorStyle: TextStyle(height: 1 * fem),

                fillColor: ColorConstant.grey600,
                errorMaxLines: 2,
                // filled: true,
                helperText: helperText,
                isDense: true,
                // contentPadding: const EdgeInsets.symmetric(vertical: 8),
                counterText: '',
                disabledBorder: const UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: ColorConstant.yellow300, width: 2),
                ),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: maxHeight ?? 25 * fem, maxWidth: 35 * fem),
                suffixIcon: customSuffixIcon,
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize:  20 * fem,
                  height: 1.1725 * ffem / fem,
                  letterSpacing:  0.4*fem,

                  color: hintColor ?? Color(0xff012622),
                  fontWeight: FontWeight.w400,
                ),

                labelText: topLabel,
                labelStyle: TextStyle(
                  color:
                  Theme.of(context).brightness == Brightness.dark
                      ? ColorConstant.grey600
                      : Colors.grey[600], // Adjust color based on theme
                  // borderRadius: BorderRadius.circular(4.0),
                ),
                prefixIcon: prefixIcon,
                errorText: errorText,
              ),


            ),
          ),

        ],
      ),
    );
  }
}
