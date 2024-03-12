import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class MyTextFieldWidget extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: AppColor.primary,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          hintText: hintText,
          filled: true,
          fillColor: AppColor.light,
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 0.8, color: AppColor.secondary),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}