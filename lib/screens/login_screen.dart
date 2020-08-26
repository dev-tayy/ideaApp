import 'package:flutter/material.dart';
import 'package:ideaApp/screens/createAccount_screen.dart';
import '../widgets/modal_bottom_sheet.dart';
import '../constants.dart';
import '../widgets/raised_button.dart';
import '../widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: kScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign in', style: kScreenTitleStyle),
            SizedBox(height: 50.0),
            Row(
              children: [
                Text(
                  "Don't have an account?  ",
                  style: TextStyle(fontSize: 24),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountScreen(),
                      )),
                  child: Text(
                    'Create a new account',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40.0),
            FormTextField(
              hintText: 'Username',
              obscureText: false,
            ),
            SizedBox(height: 20.0),
            FormTextField(
              hintText: 'Password',
              obscureText: true,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  'OR CONTINUE WITH',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AuthButton(
                    onPressed: () {},
                    label: 'Google',
                    icon: FontAwesomeIcons.google,
                    color: Colors.red),
                AuthButton(
                    onPressed: () {},
                    label: 'Facebook',
                    icon: FontAwesomeIcons.facebook,
                    color: Colors.blue),
              ],
            ),
            SizedBox(height: 30),
            InkWell(
              // onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CreateAccountScreen(),
              //     )),
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 350, bottom: 20),
                child: ButtonWidget(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, LoginScreen.id),
                    label: 'Log in')),
            Center(
              child: InkWell(
                onTap: () => buildShowModalBottomSheet(context),
                child: Text(
                  'Do it later',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
