import 'package:get/get.dart';

class FormValidator {
  static String? validatefirstname(String value) {
    if (value.isEmpty) {
      return 'Please enter your first name';
    }
    if (GetUtils.isNum(value)) {
      return 'Name cannnot contain numbers';
    }
    return null;
  }

  static String? validateothernames(String value) {
    if (GetUtils.isNum(value)) {
      return 'Name cannnot contain numbers';
    }
    return null;
  }

  static String? validatelastname(String value) {
    if (value.isEmpty) {
      return 'Please enter your last name';
    }
    if (GetUtils.isNum(value)) {
      return 'Name cannnot contain numbers';
    }
    return null;
  }

  static String? validateDOB(DateTime? value) {
    if (value!.isAtSameMomentAs(DateTime.now())) {
      return 'Invalid DOB seleted';
    }
    if (value.year < 2008) {
      return 'Invalid year Seleted';
    }
    return null;
  }

  static String? validateSex(String value) {
    if (value.isEmpty) {
      return 'Sex field is required';
    }
    if (!GetUtils.isAlphabetOnly(value)) {
      return 'Invalid Sex';
    }
    return null;
  }

  static String? validateMobile(String value) {
    if (value.isEmpty) {
      return 'Number field is required';
    }
    if (!value.isPhoneNumber) {
      return 'Enter a valid phone number';
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

  static String? validatePassportID(String value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  static String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }
}
