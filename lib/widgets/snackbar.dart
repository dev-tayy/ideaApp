import 'package:flutter/material.dart';

class IdeaAppSnackBar {
  static void showSuccessSnackBar(BuildContext context,
      {String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        backgroundColor: Colors.green,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context,
      {String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        backgroundColor: Colors.pink,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: Colors.black,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();
  }
}
