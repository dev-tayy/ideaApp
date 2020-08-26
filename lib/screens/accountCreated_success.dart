import 'package:flutter/material.dart';
import 'login_screen.dart';

class AccountCreatedSuccess extends StatelessWidget {
  static String id = 'account_created_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 200.0, horizontal: 25.0),
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                size: 200.0,
              ),
              Text(
                'Congratulations',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
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
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                  child: Text(
                    "Log in to continue",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
