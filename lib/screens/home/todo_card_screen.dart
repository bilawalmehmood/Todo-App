import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/helpers/select_card.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/screens/home/components/home_card_item.dart';
import 'package:todoapp/screens/home/controllers/home_controller.dart';
import 'package:todoapp/screens/home/view_data_screen.dart';
import 'package:todoapp/service/todo_service.dart';
import 'package:todoapp/widgets/widgets.dart';

class TodoCardScreen extends StatefulWidget {
  const TodoCardScreen({Key? key}) : super(key: key);

  @override
  State<TodoCardScreen> createState() => _TodoCardScreenState();
}

class _TodoCardScreenState extends State<TodoCardScreen> {
  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());
    final HomeController homeController = Get.put(HomeController());

    return SizedBox(
      width: Get.width,
      child: StreamBuilder(
        stream: TodoService.getCurrentUserTodoList(
            mainController.currentUser.value!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: circularProgress(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> dataMap =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                TodoModel todoModel = TodoModel.fromMap(dataMap);
                homeController.selected
                    .add(Select(tid: todoModel.tid, checkValue: false));

                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ViewDataScreen(),
                      arguments: todoModel,
                    );
                  },
                  child: HomeCardItem(
                    selected: homeController.selected[index].checkValue.obs,
                    todoModel: todoModel,
                    tid: homeController.selected[index].tid,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
