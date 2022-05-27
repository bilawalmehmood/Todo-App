import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Helper/local_storage.dart';
import 'package:todoapp/MainController/main_controller.dart';
import 'package:todoapp/Screens/Auth/log_in_screen.dart';
import 'package:todoapp/Screens/Home/todo_card_screen.dart';
import 'package:todoapp/Screens/addTodo/add_todo_screen.dart';
import 'package:todoapp/Widget/widgets.dart';
import 'package:todoapp/enum/snack_bar_masseg.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> screens = [
    const TodoCardScreen(),
    const AddTodoScreen(),
  ];

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await LocalStorage.removeCurrentUser();
      Get.find<MainController>().currentUser(null);
    } catch (e) {
      showSnackbar(SnackbarMessage.error, e.toString());
    }
    Get.offAll(() => const LogInScreen());
  }
}
