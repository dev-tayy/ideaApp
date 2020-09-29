import 'package:flutter/material.dart';
import 'package:ideaApp/services/auth/validation.dart';
import 'package:ideaApp/screens/createAccount/createAccount_screen.dart';
import '../../widgets/modal_bottom_sheet.dart';
import '../../constants.dart';
import '../../widgets/raised_button.dart';
import '../../widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/textfield_widget.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = true;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginModel>(context);
    return Scaffold(
      body: SafeArea(
        child: ProgressHUD(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              child: Form(
                key: _loginFormKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
                            onTap: () => Navigator.pushNamed(
                                context, CreateAccountScreen.id),
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
                        hintText: 'Email',
                        obscureText: false,
                        controller: model.emailController,
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
                        obscureText: _showPassword,
                        controller: model.passwordController,
                        maxLines: 1,
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
                            )),
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
                            label: 'Log in',
                            onPressed: () async {
                              if (_loginFormKey.currentState.validate()) {
                                await Provider.of<LoginModel>(context,
                                        listen: false)
                                    .login(context);
                              }
                              model.passwordController.text = '';
                            },
                          )),
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
