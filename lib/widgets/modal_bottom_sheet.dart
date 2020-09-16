import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/raised_button.dart';
import '../screens/homepage/homepage_screen.dart';

Future buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      height: 400,
      color: Color(0xFF161616),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF303030),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'As a guest',
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 14),
              Text(
                "You won't be able to leave comments,\n likes or share your own ideas.\n Are you sure that you want to continue\n without registration?",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 22, height: 1.5),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: ButtonWidget(
                  label: 'Yes, Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                ),
              ),
              SizedBox(height: 18),
              Center(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
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
  );
}
