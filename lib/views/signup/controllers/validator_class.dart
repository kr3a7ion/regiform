import 'package:get/get.dart';

class Validator {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please enter your username';
    }
    if (GetUtils.hasCapitalletter(value)) {
      return 'Username must all be in lowercase';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value.isNumericOnly) {
      return 'Password must be a combination of numbers and letters';
    }
    if (value.isAlphabetOnly) {
      return 'Password must contain at least a number';
    }
    if (!GetUtils.hasCapitalletter(value)) {
      return 'Password must contain at least one uppercase';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
