import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/model/user_model.dart';
import 'package:todoapp/res/constants.dart';

class UserService {
  static Future<void> saveUser(UserModel userModel) async {
    await Constants.userCollection
        .doc(userModel.uid)
        .set(UserModel.toMap(userModel));
  }

  static Future<UserModel> getUserDetails(String uid) async {
    DocumentSnapshot documentSnapshot =
        await Constants.userCollection.doc(uid).get();
    UserModel userModel =
        UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    return userModel;
  }
}
