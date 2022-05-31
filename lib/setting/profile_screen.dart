import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/res/images.dart';
import 'package:todoapp/setting/components/profile_layout.dart';
import 'package:todoapp/setting/controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  static final ImagePicker _picker = ImagePicker();
  static XFile? image;
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
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
                        onTap: () async {
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          print('=========>');
                          // FileImage(File(image!.path));
                          controller.updateProfileImage(File(image!.path));
                        },
                        imagePath: Images.bilawal),
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
