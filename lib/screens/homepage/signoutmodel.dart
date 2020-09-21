import 'package:flutter/widgets.dart';
import '../../services/auth/authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/shared_pref.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../login/login_screen.dart';

class SignOutModel extends ChangeNotifier {
  signout(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress.showWithText('Logging you out...');

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(SharedPref.emailKey);

    Future.delayed(Duration(seconds: 3), () {
      progress.dismiss();
    });

    await AuthenticationService().logout();

    Navigator.pushReplacementNamed(context, LoginScreen.id);
    
    notifyListeners();
  }
}
