import 'package:flutter/material.dart';
import 'package:todoapp/Res/app_color.dart';

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
      padding: const EdgeInsets.only(right: 20),
      child: Column(
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
            height: 10,
          ),
          Chip(
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
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
        ],
      ),
    );
  }
}
