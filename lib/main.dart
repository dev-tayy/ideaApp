import 'package:flutter/material.dart';
import 'package:ideaApp/screens/createAccount_screen.dart';
//import 'package:responsive_builder/responsive_builder.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/createAccount_screen.dart';
import 'screens/accountCreated_success.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        CreateAccountScreen.id: (context) => CreateAccountScreen(),
        AccountCreatedSuccess.id: (context) => AccountCreatedSuccess(),
      },
    );
  }
}





