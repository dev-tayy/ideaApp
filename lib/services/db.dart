import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 

  uploadDocuments(userMap) {
    firestore
        .collection("users")
        .doc(_auth.currentUser.uid)
        .set(userMap)
        .catchError((onError) => print('Failed to add user: $onError'));
  }
}
