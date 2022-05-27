import 'package:flutter/material.dart';
import 'package:todoapp/Res/app_color.dart';
import 'package:todoapp/Res/images.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.black87,
    title: const Text(
      'Today`s Schedual',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.bold, color: AppColor.textColor),
    ),
    actions: const [
      CircleAvatar(
        backgroundImage: AssetImage(Images.bilawal),
      ),
      SizedBox(
        width: 25,
      ),
    ],
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Monday` 21',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: AppColor.textColor),
          ),
        ),
      ),
    ),
  );
}
