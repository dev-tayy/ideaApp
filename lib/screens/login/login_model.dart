import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../services/auth/authentication_service.dart';
import '../../services/auth/auth_exception_handler.dart';
import '../../widgets/snackbar.dart';
import '../../services/shared_pref.dart';
import '../../screens/homepage/homepage_screen.dart';

class LoginModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress.showWithText('Logging in...');

    var user = await AuthenticationService().logIn(
      email: emailController.text,
      password: passwordController.text,
    );

    Future.delayed(Duration(seconds: 1), () {
      progress.dismiss();
    });

    if (user == AuthResultStatus.successful) {
      SharedPref.saveEmail(emailController.text);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(user);
      IdeaAppSnackBar.showErrorSnackBar(context, message: errorMsg);
    }
  }

  notifyListeners();
}
