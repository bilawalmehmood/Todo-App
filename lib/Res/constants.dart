import 'package:cloud_firestore/cloud_firestore.dart';

class Constants {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

// Collections
  static final CollectionReference userCollection =
      firestore.collection('users');

// Strings
  static const String appName = 'Chat App Flutter';
  static const String currentUserKey = 'currentUser';
}
