import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'accountCreated_success.dart';
import '../components/modal_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class CreateAccountScreen extends StatelessWidget {
  static String id = 'createAccount_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: kScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create new account',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ))),
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
                    style: TextStyle(fontSize: 24),
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
                hintText: 'Username',
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
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 300, bottom: 20),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountCreatedSuccess()),
                    );
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                    child: Text(
                      "Create account",
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
