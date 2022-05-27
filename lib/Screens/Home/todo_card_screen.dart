import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Res/app_color.dart';
import 'package:todoapp/Screens/Home/Components/home_card_item.dart';

class TodoCardScreen extends StatelessWidget {
  const TodoCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        child: Column(
          children: const [
            HomeCardItem(
              icon: Icons.audiotrack,
              title: 'Let`s Walk Up',
              date: '12 pm',
              iconColor: AppColor.primaryColor,
              check: false,
              iconBgColor: AppColor.textColor,
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}
