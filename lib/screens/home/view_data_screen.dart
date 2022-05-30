import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/res/app_color.dart';
import 'package:todoapp/screens/addTodo/components/todo_title.dart';
import 'package:todoapp/screens/auth/components/auth_button.dart';
import 'package:todoapp/screens/addTodo/components/todo_chip_data.dart';
import 'package:todoapp/screens/addTodo/components/todo_field.dart';
import 'package:todoapp/screens/addTodo/controllers/add_todo_controller.dart';

class ViewDataScreen extends GetView<AddTodoController> {
  final TodoModel todoModel = Get.arguments;
  RxBool edit = false.obs;
  ViewDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddTodoController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1d1e26), Color(0xff152110)],
              ),
            ),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            edit(!edit.value);
                          },
                          child: Icon(
                            Icons.edit,
                            color: edit.value ? Colors.red : Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      edit.value ? 'Editing' : 'View',
                      style: const TextStyle(
                        color: AppColor.textColor,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Your Todo',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TodoField(
                      enabled: edit.value,
                      controller: controller.titleController,
                      title: 'Title',
                      hintText: todoModel.title,
                    ),
                    const SizedBox(height: 15),
                    const TodoTitle(title: 'Task Type'),
                    Wrap(
                      children: [
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'Important',
                          color: (0xff2664fa),
                        ),
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'Planned',
                          color: (0xff2bc8d9),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    TodoField(
                      enabled: edit.value,
                      controller: controller.descriptionController,
                      title: 'Description',
                      hintText: todoModel.description,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 15),
                    const TodoTitle(title: 'Catagory'),
                    Wrap(
                      children: [
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'Food',
                          color: (0xffff6d6e),
                        ),
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'Workout',
                          color: (0xfff29732),
                        ),
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'Work',
                          color: (0xff6557ff),
                        ),
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'Design',
                          color: (0xff234ebd),
                        ),
                        ChipData(
                          selectChip: edit.value ? todoModel.task.obs : ''.obs,
                          edit: edit,
                          data: 'run',
                          color: (0xff2bc8d9),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(
                        child: AuthButton(
                            onPressed: (() {
                              FocusScope.of(context).unfocus();
                              if (controller.validate()) {
                                controller.addTodo();
                                controller.clearText();
                                Get.back();
                              }
                            }),
                            name: 'Add Todo'))
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
