import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todoapp/Res/app_color.dart';

class AuthButtonCard extends StatelessWidget {
  final String imagePath;
  final String cardName;
  final double imageSize;

  const AuthButtonCard(
      {Key? key,
      required this.cardName,
      required this.imageSize,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      height: 60,
      child: Card(
        color: AppColor.primaryColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: imageSize,
              width: imageSize,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              cardName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
