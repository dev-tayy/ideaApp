import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({@required this.onPressed, @required this.label});
  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 22.0),
        child: Text(
          label,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
