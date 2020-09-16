import 'package:email_validator/email_validator.dart';

class ValidateResponse {
  List<String> error;
  bool isValidated;
  ValidateResponse(this.error, this.isValidated);

  void isInvalid(String message) {
    if (error == null) error = new List<String>();
    this.isValidated = false;
    error.add(message);
  }
}

class LoginValidation {
  var validationResponse = ValidateResponse(null, true);
  String email;
  String username;
  String password;

  ValidateResponse isEmailValid(email) {
    if (email.isEmpty)
      validationResponse.isInvalid('Email cannot be empty or spaces');
    //This uses a plugin to validate if the email is a valid email address
    if (!EmailValidator.validate(email))
      validationResponse.isInvalid('Email Address is not a valid Email');
    return validationResponse;
  }

  ValidateResponse isPasswordValid(password) {
    if (password.isEmpty)
      validationResponse.isInvalid('Password cannot be empty or spaces');
    return validationResponse;
  }

  ValidateResponse isNameValid(username) {
    if (username.isEmpty)
      validationResponse.isInvalid('Username cannot be empty or spaces');
    return validationResponse;
  }
}

