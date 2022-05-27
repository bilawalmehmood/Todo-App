import 'package:flutter/material.dart';
import 'package:todoapp/res/app_color.dart';

class TodoTitle extends StatelessWidget {
  final String title;
  const TodoTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColor.textColor,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
      ),
    );
  }
}
