import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/addTodo/controllers/add_todo_controller.dart';

class Utils {
  static void setColorAndIconWithData(String data) {
    if (data == 'Important' || data == 'Planned') {
      Get.find<AddTodoController>().catagory(data);
    } else {
      Get.find<AddTodoController>().task(data);
      if (data == 'Food') {
        Get.find<AddTodoController>().iconData =
            Icons.local_grocery_store_outlined;
        Get.find<AddTodoController>().iconColor = Colors.blue;
      } else if (data == 'Workout') {
        Get.find<AddTodoController>().iconData = Icons.alarm;
        Get.find<AddTodoController>().iconColor = Colors.teal;
      } else if (data == 'Work') {
        Get.find<AddTodoController>().iconData = Icons.work;
        Get.find<AddTodoController>().iconColor = Colors.red;
      } else if (data == 'Design') {
        Get.find<AddTodoController>().iconData = Icons.audiotrack;
        Get.find<AddTodoController>().iconColor = Colors.yellow;
      } else {
        Get.find<AddTodoController>().iconData = Icons.run_circle_outlined;
        Get.find<AddTodoController>().iconColor = Colors.green;
      }
    }
  }

  static List<dynamic> getIconAndColor(String data) {
    if (data == 'Food') {
      return [Icons.local_grocery_store_outlined, Colors.blue];
    } else if (data == 'Workout') {
      return [Icons.alarm, Colors.teal];
    } else if (data == 'Work') {
      return [Icons.work, Colors.red];
    } else if (data == 'Design') {
      return [Icons.audiotrack, Colors.yellow];
    } else {
      return [Icons.run_circle_outlined, Colors.green];
    }
  }
}
