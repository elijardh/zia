import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';

class XTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Color fillColor;
  final TextInputType keyboardType;
  final Color normalBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color hintTextColor;
  final Color normalTextColor;
  final bool autoFocus;
  final bool isEnabled;

  XTextField({
    @required this.controller,
    @required this.hintText,
    @required this.validator,
    this.textInputAction,
    this.obscureText,
    this.fillColor,
    this.keyboardType,
    this.normalBorderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.hintTextColor,
    this.normalTextColor,
    this.autoFocus,
    this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig();

    return TextFormField(
      cursorColor: Colors.black.withOpacity(0.1),
      autofocus: autoFocus ?? false,
      enabled: isEnabled ?? true,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: sizeConfig.sp(
            15,
          ),
          color: normalTextColor ?? Colors.black),
      obscureText: obscureText ?? false,
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: sizeConfig.sp(15), color: hintTextColor ?? Colors.grey),
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.red, fontSize: sizeConfig.sp(15)),
        filled: true,
        fillColor: fillColor != null ? fillColor : Colors.transparent,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: normalBorderColor ?? Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.grey.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: focusedBorderColor ?? Theme.of(context).accentColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}

class EUnderLineButton extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Color fillColor;
  final TextInputType keyboardType;
  final Color normalBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color hintTextColor;
  final Color normalTextColor;
  final bool autoFocus;
  final bool isEnabled;
  final Widget suffix;

  EUnderLineButton({
    this.suffix,
    this.autoFocus,
    this.controller,
    this.enabledBorderColor,
    this.fillColor,
    this.focusedBorderColor,
    this.hintText,
    this.hintTextColor,
    this.isEnabled,
    this.keyboardType,
    this.normalBorderColor,
    this.normalTextColor,
    this.obscureText,
    this.textInputAction,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      cursorColor: Colors.black,
      textInputAction: textInputAction ?? TextInputAction.done,
      validator: validator,
      decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText ?? "",
          filled: true,
          fillColor: fillColor ?? Colors.white,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.black,
            width: 5,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 5,
            color: focusedBorderColor ?? Colors.black,
          ))),
    );
  }
}

class MkInputField extends StatelessWidget {
  const MkInputField(
      {@required this.controller,
      @required this.label,
      @required this.currentNode,
      this.hint,
      this.nextNode,
      this.isPassword = false,
      this.autoValidate = false,
      this.errorText,
      this.onChanged,
      this.validator,
      this.borderColor,
      this.onsaved,
      this.keyboard,
      this.initialValue,
      this.copy = false,
      this.isEnabled = true,
      this.onFieldSubmitted,
      this.textInputAction,
      this.maxLines = 1,
      this.showHint = true,
      this.isForgottenOption = false,
      this.inputFormatters,
      this.fillColor,
      this.labelColor,
      this.preffixIcon,
      this.suffixIcon})
      : assert(controller != null && label != null);

  final String label;
  final String hint;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final String errorText;
  final bool isPassword;
  final Function(String) onChanged;
  final Function(String) validator;
  final Function(String) onsaved;
  final TextInputType keyboard;
  final bool isEnabled;
  final bool copy;
  final bool autoValidate;
  final String initialValue;
  final TextInputAction textInputAction;
  final dynamic onFieldSubmitted;
  final int maxLines;
  final bool showHint;
  final TextEditingController controller;
  final bool isForgottenOption;
  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;
  final Color fillColor;
  final Color labelColor;
  final Widget suffixIcon;
  final Widget preffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: isEnabled,
      initialValue: initialValue,
      keyboardType: keyboard,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      focusNode: currentNode,
      inputFormatters: inputFormatters,
      onSaved: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onsaved(value);
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onFieldSubmitted(value);
      },
      textInputAction: textInputAction,
      autovalidate: autoValidate,
      decoration: new InputDecoration(
        suffixIcon: suffixIcon ?? null,
        prefixIcon: preffixIcon ?? null,
        fillColor: fillColor ?? XColors.primaryColor.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.values[0],
          ),
        ),
        hintStyle: TextStyle(
            color: currentNode.hasFocus ? Color(0xff7FBBCA) : Colors.black45),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.cyanAccent)),
        filled: true,
        contentPadding:
            EdgeInsets.only(bottom: 17, left: 10.0, right: 10.0, top: 17),
        labelText: label,
        labelStyle: TextStyle(
            color: labelColor ?? XColors.primaryColor.withOpacity(0.4),
            fontWeight: FontWeight.w400),
      ),
      style: const TextStyle(
          color: XColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 16),
    );
  }
}

class PasswordValidiator {
  static String validate(String val) {
    Pattern pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regex = RegExp(pattern);
    print(val);
    if (val.isEmpty) {
      return "Enter a password";
    } else if (val.length < 6 || (!regex.hasMatch(val))) {
      return "Password not strong enough";
    } else {
      return null;
    }
  }
}

class EmailValiditor {
  static String validate(String val) {
    print(val);
    if (!val.contains("@") || !val.contains(".")) {
      return "Enter a valid Email address";
    } else if (val.isEmpty) {
      return "Enter your Email address";
    } else {
      return null;
    }
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
