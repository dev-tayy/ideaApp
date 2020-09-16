import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ideaApp/constants.dart';
import '../../services/auth/authentication_service.dart';
import '../login/login_screen.dart';
import '../../widgets/slidable_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/shared_pref.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProgressHUD(
          child: Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 25.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF161616),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome to the home screen.\nDiscover, inspire and enjoy',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 25.0,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final progress = ProgressHUD.of(context);
                                  progress.showWithText('Logging you out...');

                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.remove(SharedPref.emailKey);

                                  Future.delayed(Duration(seconds: 3), () {
                                    progress.dismiss();
                                  });

                                  await AuthenticationService().logout();

                                  Navigator.pushReplacementNamed(
                                      context, LoginScreen.id);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SlidableContainer(),
                    SlidableContainer(),
                    SlidableContainer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
