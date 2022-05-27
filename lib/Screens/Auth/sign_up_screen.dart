import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Screens/Auth/Components/auth_button.dart';
import 'package:todoapp/Screens/Auth/Components/auth_check_account.dart';
import 'package:todoapp/Screens/Auth/Components/auth_field.dart';
import 'package:todoapp/Screens/Auth/Controller/sign_up_controller.dart';
import 'package:todoapp/Screens/Auth/log_in_screen.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  controller: controller.nameController,
                  hintText: 'Name',
                  textInputAction: TextInputAction.next,
                ),
                AuthField(
                  controller: controller.emailController,
                  hintText: 'Email',
                  textInputAction: TextInputAction.next,
                ),
                AuthField(
                  controller: controller.passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthButton(
                    onPressed: () {
                      if (controller.validate()) {
                        controller.signUp();
                      }
                    },
                    name: 'Sign Up'),
                AuthCheckAccount(
                    onPressed: () {
                      Get.to(() => const LogInScreen());
                    },
                    text1: 'Already have an account?',
                    text2: 'Sign In')
              ],
            ),
          )),
        ),
      ),
    );
  }
}
