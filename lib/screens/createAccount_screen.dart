import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'accountCreated_success.dart';
import '../widgets/modal_bottom_sheet.dart';
import '../widgets/raised_button.dart';
import '../widgets/auth_button.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/textfield_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  static String id = 'createAccount_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: kScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create new account', style: kScreenTitleStyle),
              SizedBox(height: 50.0),
              Row(
                children: [
                  Text(
                    'Already have an account?  ',
                    style: TextStyle(fontSize: 24),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context, LoginScreen.id),
                    child: Text(
                      'Sign In',
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
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
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
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 300, bottom: 20),
                child: ButtonWidget(
                  label: 'Create account',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountCreatedSuccess()),
                  ),
                ),
              ),
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
      ),
    );
  }
}
