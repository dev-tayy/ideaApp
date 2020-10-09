//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideaApp/services/db.dart';
import '../login/login_screen.dart';
import '../../widgets/modal_bottom_sheet.dart';
import '../../widgets/raised_button.dart';
import '../../constants.dart';
import '../../widgets/textfield_widget.dart';
import '../../services/auth/validation.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'createAccount_model.dart';

//FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
Db db = Db();

class CreateAccountScreen extends StatefulWidget {
  static String id = 'createAccount_screen';

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _showPassword = true;
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<SignUpModel>(context);
    return Scaffold(
      body: SafeArea(
        child: ProgressHUD(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              child: Form(
                key: _signUpFormKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                        keyboardType: TextInputType.name,
                        hintText: 'Username',
                        controller: model.usernameController,
                        obscureText: false,
                        validator: (value) {
                          LoginValidation loginValidation = LoginValidation();
                          var validation = loginValidation
                              .isNameValid(model.usernameController.text);
                          if (!validation.isValidated) {
                            return validation.error.first;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      FormTextField(
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                        controller: model.emailController,
                        obscureText: false,
                        validator: (value) {
                          LoginValidation loginValidation = LoginValidation();
                          var validation = loginValidation
                              .isEmailValid(model.emailController.text);
                          if (!validation.isValidated) {
                            return validation.error.first;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      FormTextField(
                        hintText: 'Password',
                        maxLines: 1,
                        obscureText: _showPassword,
                        controller: model.passwordController,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          LoginValidation loginValidation = LoginValidation();
                          var validation = loginValidation
                              .isPasswordValid(model.passwordController.text);
                          if (!validation.isValidated) {
                            return validation.error.first;
                          }
                          return null;
                        },
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 300, bottom: 20),
                        child: ButtonWidget(
                          label: 'Create account',
                          onPressed: () async {
                            if (_signUpFormKey.currentState.validate()) {
                              await Provider.of<SignUpModel>(context,
                                      listen: false)
                                  .signUp(context);
                            }

                            model.passwordController.text = '';
                          },
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
            ),
          ),
        ),
      ),
    );
  }
}
