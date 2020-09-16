import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_screen.dart';
import '../services/shared_pref.dart';
import '../screens/homepage/homepage_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );

    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });

    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var email = sharedPreferences.getString(SharedPref.emailKey);
        print(email);
        email == null
            ? Navigator.pushReplacementNamed(context, WelcomeScreen.id)
            : Navigator.pushReplacementNamed(context, HomePage.id);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/ideaLogo.png'),
            height: animation.value * 700,
            width: 500,
          ),
          Text(
            'IDEA\nAPP',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              textStyle: TextStyle(
                letterSpacing: 5.0,
                fontSize: animation.value * 70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
