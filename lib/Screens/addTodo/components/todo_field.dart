import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Res/app_color.dart';

class TodoField extends StatelessWidget {
  final String title;
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;

  const TodoField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColor.textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: maxLines! > 1 ? 10 : 3,
          ),
          margin: const EdgeInsets.only(
            bottom: 20,
          ),
          width: Get.width,
          decoration: BoxDecoration(
            color: const Color(0xff2a2e3d),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
              contentPadding: const EdgeInsets.only(left: 15, right: 15),
            ),
          ),
        ),
      ],
    );
  }
}
