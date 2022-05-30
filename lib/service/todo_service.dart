import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/res/constants.dart';

class TodoService {
  // static final MainController _mainController = Get.put(MainController());

// this mehtod will be upload thr data by the the model into firestore in the collection documents
  static Future<void> setTodoDetails(TodoModel todoModel) async {
    await Constants.todoCollection
        .doc(todoModel.tid)
        .set(TodoModel.toMap(todoModel));
  }

// this mehtod will be fetched the data into the model from firestore in the collection documents
  static Future<TodoModel> getTodoDetails(String tid) async {
    DocumentSnapshot documentSnapshot =
        await Constants.userCollection.doc(tid).get();
    TodoModel todoModel =
        TodoModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    return todoModel;
  }

  // this mehtod will be upload thr data by the the model into firestore in the collection documents
  static Future<void> updateTodoDetails(TodoModel todoModel) async {
    await Constants.todoCollection
        .doc(todoModel.tid)
        .update(TodoModel.toMap(todoModel));
  }

  // this mehtod will be delete the all data into firestore in the collection documents
  static Future<void> deleteTodoDetails(String tid) async {
    await Constants.todoCollection.doc(tid).delete().then((value) {
      Get.back();
    });
  }

  // Stream builder to collect datat into snapshot
  static Stream<QuerySnapshot> getCurrentUserTodoList(String uid) {
    return Constants.todoCollection
        .where('uid', isEqualTo: uid)
        .orderBy('date', descending: true)
        .snapshots();
  }
}
