import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/slidable_container.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class IdeaPosts extends StatelessWidget {
  static String id = 'idea_posts';
  final String username;
  const IdeaPosts({
    Key key, this.username
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 25.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
                              onTap: () async {},
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
                  SizedBox(height: 10.0),
                  SlidableContainer(username: '$username',),
                  SizedBox(height: 10.0),
                  SlidableContainer(username: '$username',),
                  SizedBox(height: 10.0),
                  SlidableContainer(username: '$username', ),
                  SizedBox(height: 10.0),
                  SlidableContainer(username: '$username',),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
