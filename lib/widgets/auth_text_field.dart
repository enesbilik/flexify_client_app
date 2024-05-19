import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final bool? enabled;
  final String labelText;
  final String hintText;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  const AuthTextField(
      {Key? key,
      this.controller,
      this.obscureText = false,
      required this.labelText,
      required this.hintText,
      this.iconData,
      this.validator,
      this.textInputType,
      this.textInputAction,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: Icon(iconData),
      ),
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
    );
  }
}
