import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/res/app_color.dart';

class AuthField extends StatelessWidget {
  final IconData? icon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? width;
  final VoidCallback? suffixPressed;

  const AuthField(
      {Key? key,
      this.icon,
      this.suffixPressed,
      this.suffixIcon,
      this.onChanged,
      this.controller,
      required this.hintText,
      this.keyboardType,
      this.textInputAction,
      this.obscureText = false,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      height: 44,
      alignment: Alignment.center,
      width: Get.width * 0.8,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(width: 1, color: AppColor.primaryLightColor),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: AppColor.cursorColor,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: AppColor.textColor,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColor.primaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: suffixPressed,
            child: Icon(
              suffixIcon,
              color: AppColor.textColor,
            ),
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15, color: AppColor.hintColor),
          contentPadding: const EdgeInsets.only(bottom: 14),
        ),
      ),
    );
  }
}
