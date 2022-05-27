import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Res/app_color.dart';

class AuthCheckAccount extends StatelessWidget {
  final String text1, text2;
  final VoidCallback onPressed;
  const AuthCheckAccount(
      {Key? key,
      required this.onPressed,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.07,
        ),
        Text(
          text1,
          style: const TextStyle(color: AppColor.textColor, fontSize: 12),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: const TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        )
      ],
    );
  }
}
