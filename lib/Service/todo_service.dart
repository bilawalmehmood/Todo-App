import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/res/constants.dart';

class TodoService {
  // static final MainController _mainController = Get.put(MainController());

  static Future<void> setTodoDetails(TodoModel todoModel) async {
    await Constants.todoCollection
        .doc(todoModel.tid)
        .set(TodoModel.toMap(todoModel));
  }

  static Future<TodoModel> getTodoDetails(String tid) async {
    DocumentSnapshot documentSnapshot =
        await Constants.userCollection.doc(tid).get();
    TodoModel todoModel =
        TodoModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    return todoModel;
  }
}
