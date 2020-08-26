import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField({@required this.hintText, this.obscureText, this.keyboardType});
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: false,
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey.shade400),
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0)),
      ),
    );
  }
}
