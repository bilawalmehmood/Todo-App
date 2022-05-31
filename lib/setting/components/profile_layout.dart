import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLayout extends StatelessWidget {
  final VoidCallback? onTap;
  final String userName;
  final String imagePath;

  const ProfileLayout(
      {Key? key,
      required this.userName,
      required this.imagePath,
      required this.onTap})
      : super(key: key);

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
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(imagePath),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 0,
                          child: InkWell(
                            onTap: onTap,
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
                      userName,
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
