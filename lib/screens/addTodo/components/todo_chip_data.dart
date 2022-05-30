import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/res/app_color.dart';
import 'package:todoapp/screens/addTodo/controllers/add_todo_controller.dart';

class ChipData extends StatelessWidget {
  final String title;
  final String data;
  RxString? selectChip = 'no'.obs;
  RxBool? edit = false.obs;
  final int color;
  ChipData(
      {Key? key,
      this.title = '',
      required this.data,
      this.selectChip,
      this.edit,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddTodoController todoController = Get.put(AddTodoController());

    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10, top: 5),
      child: Obx(
        () => InkWell(
          onTap: edit!.value
              ? (() {
                  todoController.setData(data);
                })
              : null,
          child: Obx(
            () => Chip(
              backgroundColor: (data == todoController.task.value ||
                      data == todoController.catagory.value ||
                      data == selectChip!.value)
                  ? Colors.white
                  : Color(color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              label: Text(
                data,
                style: TextStyle(
                    color: (data == todoController.task.value ||
                            data == todoController.catagory.value ||
                            data == selectChip!.value)
                        ? Colors.black
                        : AppColor.textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            ),
          ),
        ),
      ),
    );
  }
}
