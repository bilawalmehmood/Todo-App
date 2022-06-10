import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final Reference _storageReference = FirebaseStorage.instance.ref();

  static Future<String> uploadProfileImage(File imageFile, String uid) async {
    await _storageReference
        .child('profile_images')
        .child(uid)
        .putFile(imageFile);

    String downloadURL =
        await _storageReference.child('profile_images/$uid').getDownloadURL();
    return downloadURL;
  }

  static Future<String> uploadCoverImage(File imageFile, String uid) async {
    await _storageReference.child('cover_images').child(uid).putFile(imageFile);
    String downloadURL =
        await _storageReference.child('cover_images/$uid').getDownloadURL();
    return downloadURL;
  }
}
