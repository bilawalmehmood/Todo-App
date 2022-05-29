import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/auth/components/auth_button.dart';
import 'package:todoapp/screens/auth/components/auth_check_account.dart';
import 'package:todoapp/screens/auth/components/auth_field.dart';
import 'package:todoapp/screens/auth/controller/log_in_controller.dart';
import 'package:todoapp/screens/auth/sign_up_screen.dart';
import 'package:todoapp/widgets/widgets.dart';

class LogInScreen extends GetView<LogInController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());
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
                  'Log In',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
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
                    suffixIcon: controller.check.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  (() => controller.loading.value
                      ? circularProgress()
                      : AuthButton(
                          onPressed: () {
                            if (controller.validate()) {
                              controller.signIn();
                            }
                          },
                          name: 'Log In')),
                ),
                AuthCheckAccount(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    text1: 'If you don`t have have an account?',
                    text2: 'Sign Up')
              ],
            ),
          )),
        ),
      ),
    );
  }
}
