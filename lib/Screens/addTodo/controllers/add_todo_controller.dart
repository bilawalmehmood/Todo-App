import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todoapp/main-controller/main_controller.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/service/todo_service.dart';
import 'package:todoapp/widget/widgets.dart';

import '../../../enum/snack_bar_masseg.dart';

class AddTodoController extends GetxController {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  final MainController _mainController = Get.put(MainController());

  RxBool loading = false.obs;
  RxString task = ''.obs;
  RxString catagory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void addTodo() async {
    try {
      loading(true);
      TodoModel todoModel = TodoModel(
        uid: _mainController.currentUser.value!.uid,
        tid: '2',
        title: titleController.text,
        task: task.value,
        description: descriptionController.text,
        catagory: catagory.value,
      );

      await TodoService.setTodoDetails(todoModel);
      showSnackbar(SnackbarMessage.success, 'Todo Added Succefully');
      loading(false);
    } catch (e) {
      loading(false);
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  bool validate() {
    if (titleController.text.isEmpty && descriptionController.text.isEmpty) {
      showSnackbar(
          SnackbarMessage.missing, 'Please enter the title and description.');
      return false;
    } else if (titleController.text.isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter the title.');
      return false;
    } else if (descriptionController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your description.');
      return false;
    } else {
      return true;
    }
  }
}
