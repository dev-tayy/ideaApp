import 'package:flutter/material.dart';
import 'package:ideaApp/screens/createAccount/createAccount_screen.dart';
//import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/createAccount/createAccount_screen.dart';
import 'screens/createAccount/accountCreated_success.dart';
import 'screens/homepage/homepage_screen.dart';
import './services/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: providers, child: MyApp()));
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
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
