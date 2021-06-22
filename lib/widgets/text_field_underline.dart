import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';

class TextFieldUnderline extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color normalBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color hintTextColor;
  final Color normalTextColor;
  final bool autoFocus;
  final bool isEnabled;
  final String initialValue;

  final SizeConfig sizeConfig = SizeConfig();

  TextFieldUnderline({
    @required this.controller,
    @required this.hintText,
    @required this.validator,
    this.textInputAction,
    this.obscureText,
    this.keyboardType,
    this.normalBorderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.hintTextColor,
    this.normalTextColor,
    this.autoFocus,
    this.isEnabled,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      initialValue: initialValue,
      autofocus: autoFocus ?? false,
      enabled: isEnabled ?? true,
      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: sizeConfig.sp(15,), color: normalTextColor ?? Colors.black),
      obscureText: obscureText ?? false,
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: sizeConfig.sp(15), color: hintTextColor ?? Colors.grey),
        errorStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.red, fontSize: sizeConfig.sp(15)),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
        ),
      ),
    );
  }
}
