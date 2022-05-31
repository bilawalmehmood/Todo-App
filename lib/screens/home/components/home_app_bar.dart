import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/res/app_color.dart';
import 'package:todoapp/res/images.dart';
import 'package:todoapp/screens/auth/log_in_screen.dart';
import 'package:todoapp/screens/home/controllers/home_controller.dart';

AppBar homeAppBar() {
  final HomeController controller = Get.put(HomeController());
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
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Monday` 21',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.onChanged();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      () => controller.logout();
                      Get.offAll(() => const LogInScreen());
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
