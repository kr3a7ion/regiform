import 'package:get/get.dart';

class ResetPasswordValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

}
