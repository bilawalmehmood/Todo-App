import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

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
}
