import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/setting/components/profile_layout.dart';
import 'package:todoapp/setting/controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.blue,
                Colors.black,
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "User\n Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'NiseBuschGardens'),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 20),
                    ProfileLayout(
                      userName: mainController.currentUser.value!.name,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
