import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Helper/local_storage.dart';
import 'package:todoapp/MainController/main_controller.dart';
import 'package:todoapp/Screens/Auth/log_in_screen.dart';
import 'package:todoapp/Screens/Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final MainController _mainController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      if (FirebaseAuth.instance.currentUser == null) {
        Get.offAll(() => const LogInScreen());
      } else {
        if (LocalStorage.hasCurrentUser()) {
          _mainController.getCurrentUser();
          Get.offAll(() => const HomeScreen());
        } else {
          await FirebaseAuth.instance.signOut();
          Get.offAll(() => const LogInScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Schreen'),
      ),
    );
  }
}
