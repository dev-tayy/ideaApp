import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField(
      {@required this.hintText,
      this.obscureText,
      this.keyboardType,
      this.suffixIcon,
      @required this.controller,
      @required this.validator});
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputType keyboardType;

  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
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
