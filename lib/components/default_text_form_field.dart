import 'package:flutter/material.dart';

import '../app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    Key? key,
    this.controller,
    required this.hint,
    this.icon,
    this.errorText,
    this.isPassword = false,
    this.maxLines = 1,
    this.borderColor,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hint;
  final IconData? icon;
  final String? errorText;
  final bool isPassword;
  final int maxLines;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: AppColors.defaultGreyColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        prefixIcon: icon != null
            ? Icon(
                icon,
                size: icon != null ? 30.0 : 0,
                color: AppColors.defaultShadowedGreyColor,
              )
            : null,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.defaultGreyColor,
          fontSize: 15.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.defaultShadowedGreyColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.defaultShadowedGreyColor,
          ),
        ),
      ),
      maxLines: maxLines,
      obscureText: isPassword,
      validator: (text) {
        if (text!.isEmpty) {
          return errorText;
        } else {
          return null;
        }
      },
    );
  }
}
