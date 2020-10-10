import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Db {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  uploadUserCredentials(userMap) {
    firestore
        .collection("users")
        .doc(_auth.currentUser.uid)
        .set(userMap)
        .catchError((onError) => print('Failed to add user: $onError'));
  }

  uploadUserPosts(userPostsMap) {
    firestore
        .collection("posts")
        .doc()
        .set(userPostsMap)
        .catchError((onError) => print('Failed to upload post: $onError'));
  }
}
