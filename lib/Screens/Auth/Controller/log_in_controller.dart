import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/helper/local_storage.dart';
import 'package:todoapp/main-controller/main_controller.dart';
import 'package:todoapp/model/user_model.dart';
import 'package:todoapp/screens/home/home_screen.dart';
import 'package:todoapp/service/auth_service.dart';
import 'package:todoapp/service/user_service.dart';
import 'package:todoapp/widget/widgets.dart';
import 'package:todoapp/enum/snack_bar_masseg.dart';

class LogInController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final MainController _mainController = Get.put(MainController());

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signIn() async {
    try {
      loading(true);
      User? user = await AuthService.logIn(
          emailController.text.trim(), passwordController.text);
      if (user != null) {
        UserModel userModel = await UserService.getUserDetails(user.uid);
        await LocalStorage.saveUser(userModel);
        _mainController.getCurrentUser();
        loading(false);
        Get.offAll(() => const HomeScreen());

        showSnackbar(SnackbarMessage.success, 'Loged in successfully');
      } else {
        loading(false);
        showSnackbar(SnackbarMessage.missing, 'Somthing went to wrong');
      }
    } catch (e) {
      loading(false);
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  bool validate() {
    if (emailController.text.trim().isEmpty &&
        passwordController.text.isEmpty) {
      showSnackbar(
          SnackbarMessage.missing, 'Please enter your email and passsword.');
      return false;
    } else if (emailController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your email.');
      return false;
    } else if (passwordController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your password.');
      return false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      showSnackbar(SnackbarMessage.error, 'Invalid email.');
      return false;
    } else {
      return true;
    }
  }
}
