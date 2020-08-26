import 'package:flutter/material.dart';
import 'package:ideaApp/screens/createAccount_screen.dart';
import '../components/modal_bottom_sheet.dart';
import '../constants.dart';

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
            Text(
              'Sign in',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            TextField(
              showCursor: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0)),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              showCursor: false,
              autocorrect: false,
              style: TextStyle(fontSize: 20, color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Password',
                  hintStyle:
                      TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  border: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent, width: 2.0))),
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
                RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 30.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.g_translate,
                        color: Colors.red,
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        'Google',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 30.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.g_translate,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        'Facebook',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ],
                  ),
                ),
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
              child: RaisedButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, LoginScreen.id);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                    child: Text(
                      "Log in",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
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
    );
  }
}
