import 'package:flutter/material.dart';
import '../constants.dart';


class AuthButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData icon;
  final Color color;
  AuthButton(
      {@required this.onPressed, @required this.label, @required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 30.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 15.0),
          Text(
            label,
            style: kAuthButtonTextStyle,
          ),
        ],
      ),
    );
  }
}
 
