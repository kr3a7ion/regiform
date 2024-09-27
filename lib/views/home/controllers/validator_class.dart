import 'package:get/get.dart';

class FormValidator {
  static String? validatefullname(String value) {
    if (value.isEmpty) {
      return 'Please enter your fullname';
    }
    if (GetUtils.isNum(value)) {
      return 'Name cannnot contain numbers';
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

  static String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  static String? validatePasspordID(String value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  static String? validateSex(String value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    if (!GetUtils.isAlphabetOnly(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateMobile(String value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }
}
