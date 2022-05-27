import 'package:flutter/material.dart';
import 'package:todoapp/res/app_color.dart';
import 'package:todoapp/screens/addTodo/components/todo_title.dart';

class ChipData extends StatelessWidget {
  final String title;
  final String data;
  final int color;
  const ChipData(
      {Key? key, this.title = '', required this.data, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10, top: 5),
      child: InkWell(
        onTap: (() {}),
        child: Chip(
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            data,
            style: const TextStyle(
                color: AppColor.textColor,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        ),
      ),
    );
  }
}
