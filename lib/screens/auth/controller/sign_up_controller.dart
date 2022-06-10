import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/helpers/local_storage.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/models/user_model.dart';
import 'package:todoapp/screens/home/home_screen.dart';
import 'package:todoapp/service/auth_service.dart';
import 'package:todoapp/service/user_service.dart';
import 'package:todoapp/widgets/widgets.dart';
import 'package:todoapp/enum/snack_bar_masseg.dart';

class SignUpController extends GetxController {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final MainController _mainController = Get.put(MainController());

  RxBool loading = false.obs;
  RxBool check = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() async {
    try {
      loading(true);
      // Sign up to google and create user simple
      User? user = await AuthService.signUp(
          emailController.text.trim(), passwordController.text);

      // Here after create user then storing our data with user id into user model that will be help me store data into firestore
      if (user != null) {
        UserModel userModel = UserModel(
          uid: user.uid,
          email: emailController.text.trim(),
          name: nameController.text.trim(),
          profileImage: null,
        );
        // Here save the data into firestore with the help of user model
        await UserService.saveUser(userModel);
        await LocalStorage.saveUser(userModel);
        _mainController.getCurrentUser();
        showSnackbar(SnackbarMessage.success, 'Registered Succefully');
        loading(false);
        Get.offAll(() => const HomeScreen());
      }
    } catch (e) {
      loading(false);
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  bool validate() {
    if (nameController.text.trim().isEmpty &&
        emailController.text.trim().isEmpty &&
        passwordController.text.isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your all details.');
      return false;
    } else if (nameController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your name.');
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
