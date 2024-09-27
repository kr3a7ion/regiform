import 'package:get/get.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';
import 'package:regiform/views/login/model/signinvalidator.dart';

final SignInController _signInController = Get.put(SignInController());

// login form submission
bool validator() {
  final emailError =
      SignInValidator.validateEmail(_signInController.signInEmailController.text.trim());
  if (emailError != null) {
    _signInController.errorMessage.value = emailError;
    return false;
  }

  final passwordError =
      SignInValidator.validatePassword(
      _signInController.signInPasswordController.text.trim());
  if (passwordError != null) {
    _signInController.errorMessage.value = passwordError;
    return false;
  }

  _signInController.errorMessage.value = '';
  return true;
}
