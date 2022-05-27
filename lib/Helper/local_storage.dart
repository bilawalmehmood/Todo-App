import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:todoapp/Model/user_model.dart';
import 'package:todoapp/Res/constants.dart';

class LocalStorage {
  static final GetStorage getStorage = GetStorage();

  static Future<void> saveUser(UserModel userModel) async {
    await getStorage.write(
      Constants.currentUserKey,
      json.encode(UserModel.toMap(userModel)),
    );
  }

  static UserModel readUser() {
    return UserModel.fromMap(
        json.decode(getStorage.read(Constants.currentUserKey)));
  }

  static bool hasCurrentUser() {
    return getStorage.hasData(Constants.currentUserKey);
  }

  static Future<void> removeCurrentUser() async {
    await getStorage.remove(Constants.currentUserKey);
  }
}
