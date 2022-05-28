import 'package:cloud_firestore/cloud_firestore.dart';

class Constants {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

// Collections
  static final CollectionReference userCollection =
      firestore.collection('users');
  static final CollectionReference todoCollection =
      firestore.collection('todo');

// Stream builder to collect datat into snapshot
  static final Stream<QuerySnapshot> stream =
      firestore.collection('todo').snapshots();

// Strings
  static const String appName = 'Chat App Flutter';
  static const String currentUserKey = 'currentUser';
}
