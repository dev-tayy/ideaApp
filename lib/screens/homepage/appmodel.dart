import 'package:flutter/material.dart';
import 'package:ideaApp/services/db.dart';


Db db = Db();

class AppModel extends ChangeNotifier {
  int currentIndex = 0;
  void toggle(int index) {
    currentIndex = index;
    notifyListeners();
  }

  TextEditingController ideaTitleController = TextEditingController();
  TextEditingController ideaTextController = TextEditingController();

  postIdea() {
    Map<String, String> userPosts = {
      "Username": "username",
      "Idea Title": ideaTitleController.text,
      "Idea Text": ideaTextController.text
    };
    db.uploadUserPosts(userPosts);
    
  }
}
