import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../services/auth/authentication_service.dart';
import '../../services/auth/auth_exception_handler.dart';
import '../../widgets/snackbar.dart';
import '../../screens/createAccount/accountCreated_success.dart';
import '../../services/db.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class SignUpModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Db db = Db();

  signUp(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress.showWithText('Creating account...');

    Map<String, String> userCredentials = {
      "email": emailController.text.trim(),
      "username": usernameController.text.trim()
    };

    var newUser = await AuthenticationService().createAccount(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    Future<bool> checkUsernameExists(String username) async {
      var checkUsername = (await firestore
                  .collection("users")
                  .where('username', isEqualTo: username)
                  .get())
              .docs
              .length >
          0;
      print(checkUsername);
      if (checkUsername == false) {
        if (newUser == AuthResultStatus.successful) {
          db.uploadDocuments(userCredentials);
          Navigator.popAndPushNamed(context, AccountCreatedSuccess.id);
        } else {
          final errorMsg =
              AuthExceptionHandler.generateExceptionMessage(newUser);
          IdeaAppSnackBar.showErrorSnackBar(context, message: errorMsg);
        }
      } else {
        IdeaAppSnackBar.showErrorSnackBar(context,
            message: 'Username already exists');
      }
      return checkUsername;
    }

    checkUsernameExists(usernameController.text);

    Future.delayed(Duration(seconds: 1), () {
      progress.dismiss();
    });
  }

  notifyListeners();
}
