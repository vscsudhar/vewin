import 'package:flutter/material.dart';

import '../shared/styles.dart';
import '../shared/text_style_helpers.dart';

class TextField1 extends StatelessWidget {
  const TextField1({
    this.obscureText,
    this.initialValue,
    this.hintText,
    this.hintStyle,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.color,
    this.controller,
    this.type,
    super.key,
  });

  final String? initialValue;
  final String? hintText;
  final TextStyle? hintStyle;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Color? color;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type ?? TextInputType.text, //username or email
      initialValue: initialValue ?? '',
      style: fontFamilyBold.size14.copyWith(color: color ?? appwhite1),
      decoration: InputDecoration(
        focusColor: Colors.white,
        hintText: hintText ?? '',
        hintStyle: hintStyle,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: Colors.white)),
      ),
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      autofocus: true,
      focusNode: FocusNode(debugLabel: hintText),
      controller: controller,
    );
  }
}
