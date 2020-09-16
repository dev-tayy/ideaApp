import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_exception_handler.dart';

class AuthenticationService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResultStatus _status;

  Future<AuthResultStatus> logIn({
    @required String email,
    @required String password,
  }) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user != null
          ? _status = AuthResultStatus.successful
          : _status = AuthResultStatus.undefined;
    } catch (e) {
      print('Exception @login: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<AuthResultStatus> createAccount({
    @required String email,
    @required String password,
  }) async {
    try {
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      newUser != null
          ? _status = AuthResultStatus.successful
          : _status = AuthResultStatus.undefined;
    } catch (e) {
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<void> logout() async{
    await _auth.signOut();
  }
}
