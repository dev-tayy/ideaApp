import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ideaApp/services/db.dart';
import 'package:ideaApp/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends ChangeNotifier {
  Db db = Db();

  int currentIndex = 0;
  void toggle(int index) {
    currentIndex = index;
    notifyListeners();
  }

  TextEditingController ideaTitleController = TextEditingController();
  TextEditingController ideaTextController = TextEditingController();

  postIdea(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress.showWithText('Posting...');

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loggedInUser = sharedPreferences.getString(SharedPref.usernameKey);

    Map<String, String> userPosts = {
      "Username": loggedInUser,
      "Idea Title": ideaTitleController.text,
      "Idea Text": ideaTextController.text
    };
    db.uploadUserPosts(userPosts);

    Future.delayed(Duration(seconds: 1), () {
      progress.showWithText('Posted');
      progress.dismiss();
    });
  }
}
