import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Res/app_color.dart';
import 'package:todoapp/Screens/Auth/Components/auth_button.dart';
import 'package:todoapp/Screens/addTodo/components/chip_data.dart';
import 'package:todoapp/Screens/addTodo/components/todo_field.dart';
import 'package:todoapp/Screens/addTodo/controllers/add_todo_controller.dart';

class AddTodoScreen extends GetView<AddTodoController> {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddTodoController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1d1e26), Color(0xff252140)],
            ),
          ),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'New Todo',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TodoField(
                        controller: controller.titleController,
                        title: 'Title',
                        hintText: 'Task Tilte',
                      ),
                      Row(
                        children: const [
                          ChipData(
                              title: 'Task Type',
                              data: 'important',
                              color: (0xff2664fa)),
                          ChipData(data: 'Planned', color: (0xff2bc8d9)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TodoField(
                        controller: controller.descriptionController,
                        title: 'Description',
                        hintText: 'Task Description',
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: const [
                          ChipData(
                              title: 'Catagory',
                              data: 'Food',
                              color: (0xffff6d6e)),
                          ChipData(data: 'Workout', color: (0xfff29732)),
                          ChipData(data: 'Work', color: (0xff6557ff)),
                          ChipData(data: 'Design', color: (0xff234ebd)),
                          ChipData(data: 'run', color: (0xff2bc8d9)),
                        ],
                      ),
                    ],
                  ),
                ),
                AuthButton(onPressed: () {}, name: 'Add Todo')
              ],
            ),
          )),
        ),
      ),
    );
  }
}
