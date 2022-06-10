import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/enum/snack_bar_masseg.dart';
import 'package:todoapp/setting/controllers/profile_controller.dart';
import 'package:todoapp/widgets/widgets.dart';

class ProfileLayout extends StatefulWidget {
  final String userName;

  const ProfileLayout({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  ProfileController controller = Get.put(ProfileController());
  final MainController mainController = Get.put(MainController());

  Future _imagePicker() async {
    try {
      final pick = await _picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pick != null) {
          image = File(pick.path);
          controller.updateProfileImage(image!);
        } else {
          showSnackbar(SnackbarMessage.error, 'No Image selected');
        }
      });
    } catch (e) {
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      width: Get.width * 0.8,
      color: Colors.black87,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double innerHight = constraints.maxHeight;
          double innerWidth = constraints.maxWidth;
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: innerHight * 0.74,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        mainController.currentUser.value!.profileImage == null
                            ? const CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey,
                                child: Text('Images not Selected'),
                              )
                            : Obx(
                                () => CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(mainController
                                      .currentUser.value!.profileImage
                                      .toString()),
                                ),
                              ),
                        Positioned(
                          bottom: 20,
                          right: 0,
                          child: InkWell(
                            onTap: _imagePicker,
                            child: const Icon(
                              Icons.camera_enhance_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 185, 189, 214),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.userName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NiseBuschGardens'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
