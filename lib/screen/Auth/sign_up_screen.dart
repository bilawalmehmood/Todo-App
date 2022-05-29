import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/auth/components/auth_button.dart';
import 'package:todoapp/screens/auth/components/auth_check_account.dart';
import 'package:todoapp/screens/auth/components/auth_field.dart';
import 'package:todoapp/screens/auth/controller/sign_up_controller.dart';
import 'package:todoapp/screens/auth/log_in_screen.dart';

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
                Obx(
                  () => AuthField(
                    suffixPressed: (() {
                      controller.check(!controller.check.value);
                    }),
                    controller: controller.passwordController,
                    hintText: 'Password',
                    obscureText: controller.check.value,
                    textInputAction: TextInputAction.done,
                    suffixIcon: controller.check.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
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
