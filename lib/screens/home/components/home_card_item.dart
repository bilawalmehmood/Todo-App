import 'package:flutter/material.dart';
import 'package:todoapp/helpers/date_time_operations.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/res/app_color.dart';
import 'package:todoapp/utils/utils.dart';

class HomeCardItem extends StatelessWidget {
  final TodoModel todoModel;

  const HomeCardItem({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
            unselectedWidgetColor: const Color(0xfffe616a),
          ),
          child: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: false,
              activeColor: const Color(0xff6cf8a9),
              checkColor: const Color(0xff0e3e26),
              onChanged: (value) {},
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 75,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color(0xff2a2e3d),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                    height: 33,
                    width: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Utils.getIconAndColor(todoModel.catagory)[0],
                      color: Utils.getIconAndColor(todoModel.catagory)[1],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      todoModel.title,
                      style: const TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                  ),
                  Text(
                    DateTimeOperations.getFormattedTimeAgo(
                        todoModel.date.toDate()),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
