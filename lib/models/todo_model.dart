import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String tid;
  late String uid;
  late String title;
  late String task;
  late String description;
  late String catagory;
  late Timestamp date;

  TodoModel({
    required this.uid,
    required this.tid,
    required this.title,
    required this.task,
    required this.description,
    required this.catagory,
    required this.date,
  });

  static Map<String, dynamic> toMap(TodoModel todoModel) {
    var data = <String, dynamic>{};
    data['uid'] = todoModel.uid;
    data['tid'] = todoModel.tid;
    data['title'] = todoModel.title;
    data['task'] = todoModel.task;
    data['description'] = todoModel.description;
    data['catagory'] = todoModel.catagory;
    data['date'] = todoModel.date;

    return data;
  }

  TodoModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'];
    tid = mapData['tid'];
    title = mapData['title'];
    task = mapData['task'];
    description = mapData['description'];
    catagory = mapData['catagory'];
    date = mapData['date'];
  }
}
