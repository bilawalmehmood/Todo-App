import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/screens/addTodo/controllers/add_todo_controller.dart';
import 'package:todoapp/screens/home/components/home_card_item.dart';
import 'package:todoapp/service/todo_service.dart';
import 'package:todoapp/widgets/widgets.dart';

class TodoCardScreen extends StatelessWidget {
  const TodoCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());
    final AddTodoController addTodoController = Get.put(AddTodoController());

    return SizedBox(
        width: Get.width,
        child: StreamBuilder(
            stream: TodoService.getCurrentUserTodoList(
                mainController.currentUser.value!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: circularProgress(),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      Map<String, dynamic> document = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      addTodoController.setColorAndIcon(document['task']);

                      return HomeCardItem(
                          icon: addTodoController.iconData!,
                          title: document['title'],
                          date: document['date'],
                          iconColor: addTodoController.iconColor!,
                          check: true,
                          iconBgColor: Colors.white);
                    }));
              }
            }));
  }
}
