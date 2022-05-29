import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/res/app_color.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final Color backgroundColor;
  final Color? textColor;
  final double? width;
  const AuthButton({
    Key? key,
    required this.onPressed,
    required this.name,
    this.textColor,
    this.backgroundColor = AppColor.buttonColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            width ?? Get.width * 0.8,
            44,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
