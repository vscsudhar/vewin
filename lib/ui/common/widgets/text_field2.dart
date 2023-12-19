import 'package:flutter/material.dart';

import '../shared/styles.dart';
import '../shared/text_style_helpers.dart';

class TextField2 extends StatelessWidget {
  const TextField2({
    this.obscureText,
    this.readOnly,
    this.initialValue,
    this.hintText,
    this.hintStyle,
    this.onSaved,
    this.onChanged,
    this.maxLength,
    this.validator,
    this.textAlign,
    this.keyboard,
    this.onTap,
    super.key,
  });

  final String? initialValue;
  final String? hintText;
  final TextStyle? hintStyle;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? readOnly;
  final int? maxLength;
  final TextAlign? textAlign;
  final TextInputType? keyboard;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxLength,
      keyboardType: keyboard ?? TextInputType.text, //username or email
      initialValue: initialValue ?? '',
      style: fontFamilyBold.size16,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        hintStyle: hintStyle,
        focusColor: Colors.black,

        focusedBorder: const UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        // border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      ),

      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      autofocus: true,
      readOnly: readOnly ?? false,
      onTap: onTap,
    );
  }
}
