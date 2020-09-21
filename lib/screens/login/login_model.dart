import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../services/auth/authentication_service.dart';
import '../../services/auth/auth_exception_handler.dart';
import '../../widgets/snackbar.dart';
import '../../services/shared_pref.dart';
import '../../screens/homepage/homepage_screen.dart';
import '../../services/db.dart';

class LoginModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Db db = Db();

  login(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress.showWithText('Logging in...');

    var user = await AuthenticationService().logIn(
      email: emailController.text,
      password: passwordController.text,
    );

    var username = await db.getUserByUsername(emailController.text);
    print(username);

    Future.delayed(Duration(seconds: 1), () {
      progress.dismiss();
    });

    if (user == AuthResultStatus.successful) {
      SharedPref.saveEmail(emailController.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage(
          username: username,
        );
      }));
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(user);
      IdeaAppSnackBar.showErrorSnackBar(context, message: errorMsg);
    }
  }

  notifyListeners();
}
