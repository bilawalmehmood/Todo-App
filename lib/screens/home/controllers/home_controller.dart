import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/enum/snack_bar_masseg.dart';
import 'package:todoapp/helpers/local_storage.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/helpers/select_card.dart';
import 'package:todoapp/screens/addTodo/add_todo_screen.dart';
import 'package:todoapp/screens/auth/log_in_screen.dart';

import 'package:todoapp/screens/home/todo_card_screen.dart';
import 'package:todoapp/service/todo_service.dart';
import 'package:todoapp/setting/profile_screen.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Select> selected = [];

  final List<Widget> screens = [
    const TodoCardScreen(),
    const AddTodoScreen(),
    const ProfileScreen(),
  ];

  Future<void> onChanged() async {
    for (int i = 0; i < selected.length; i++) {
      if (selected[i].checkValue) {
        await TodoService.deleteTodoDetails(selected[i].tid!);
      }
    }
  }

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
