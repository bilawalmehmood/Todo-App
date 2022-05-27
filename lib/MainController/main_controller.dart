import 'package:get/get.dart';
import 'package:todoapp/Helper/local_storage.dart';
import 'package:todoapp/Model/user_model.dart';
import 'package:todoapp/Service/user_service.dart';

class MainController extends GetxController {
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  //Reads current user Data from pref and stores in currrent user variable
  // whuch will be accessible throughout the apps
  void getCurrentUser() {
    UserModel userModel = LocalStorage.readUser();
    currentUser(userModel);
  }

  Future<bool> refreshCurrentUser() async {
    try {
      UserModel userModel =
          await UserService.getUserDetails(currentUser.value!.uid);
      await LocalStorage.saveUser(userModel);
      return true;
    } catch (e) {
      // Failed to refresh user
      return false;
    }
  }
}
