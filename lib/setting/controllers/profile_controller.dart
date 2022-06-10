import 'dart:io';
import 'package:get/get.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/enum/snack_bar_masseg.dart';
import 'package:todoapp/helpers/local_storage.dart';
import 'package:todoapp/models/user_model.dart';
import 'package:todoapp/service/storage_service.dart';
import 'package:todoapp/service/user_service.dart';
import 'package:todoapp/widgets/widgets.dart';

class ProfileController extends GetxController {
  MainController mainController = Get.put(MainController());
  RxBool loading = false.obs;

  void updateProfileImage(File imageFile) async {
    try {
      loading(true);
      print('==============> 33 $imageFile');
      String downloadURL = await StorageService.uploadProfileImage(
          imageFile, mainController.currentUser.value!.uid);
      await UserService.updateProfileImage(
          mainController.currentUser.value!.uid, downloadURL);

      UserModel userModel = mainController.currentUser.value!;
      userModel.profileImage = downloadURL;
      await LocalStorage.saveUser(userModel);
      mainController.getCurrentUser();
      loading(false);
      showSnackbar(SnackbarMessage.success, 'Profile Image uploaded ');
    } catch (e) {
      loading(false);
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }
}
