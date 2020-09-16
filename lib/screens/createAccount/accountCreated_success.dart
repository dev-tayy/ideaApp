import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../../widgets/raised_button.dart';
import '../../constants.dart';

class AccountCreatedSuccess extends StatelessWidget {
  static String id = 'account_created_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 200.0, horizontal: 25.0),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 200.0,
                  ),
                  Text('Congratulations', style: kScreenTitleStyle),
                  SizedBox(
                    height: 20.0,
                    child: Divider(
                      height: 10.0,
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Your account has been created successfully!\n Please log in to continue.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, height: 1.5),
                  ),
                  SizedBox(height: 20.0),
                  ButtonWidget(
                    label: 'Log in to continue',
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, LoginScreen.id),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
