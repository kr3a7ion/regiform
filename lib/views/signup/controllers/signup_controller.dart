import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/authcontroller.dart';
import 'package:regiform/views/login/loginscreen.dart';
import 'package:regiform/views/signup/controllers/validator_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:regiform/views/signup/model/signupmodel.dart';

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final Authcontroller _auth = Get.put(Authcontroller());
  final CreateUser _createUserDB = Get.put(CreateUser());

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Validate the input fields using the Validator class
  bool validate() {
    final usernameError =
        Validator.validateUsername(usernameController.text.trim());
    if (usernameError != null) {
      errorMessage.value = usernameError;
      return false;
    }

    final emailError = Validator.validateEmail(emailController.text.trim());
    if (emailError != null) {
      errorMessage.value = emailError;
      return false;
    }

    final passwordError =
        Validator.validatePassword(passwordController.text.trim());
    if (passwordError != null) {
      errorMessage.value = passwordError;
      return false;
    }

    final confirmPasswordError = Validator.validateConfirmPassword(
      passwordController.text.trim(),
      confirmPasswordController.text.trim(),
    );
    if (confirmPasswordError != null) {
      errorMessage.value = confirmPasswordError;
      return false;
    }

    errorMessage.value = '';
    return true;
  }

  void signUp() async {
    if (!validate()) {
      return;
    }

    try {
      isLoading.value = true;
      UserCredential userCredential =
          await _auth.authIn.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Set the uid from Firebase Authentication
      var uid = userCredential.user?.uid;
      isLoading.value = false;

      _createUserDB.email = emailController.text.trim();
      _createUserDB.username = usernameController.text.trim();
      _createUserDB.uid = uid;
      if (uid!.isEmpty) {
        throw Exception('User data not complete');
      }
      await _createUserDB.createUser();
      Get.snackbar('Success', 'Registration successful!',
          snackPosition: SnackPosition.BOTTOM, snackStyle: SnackStyle.FLOATING);
      Get.offAll(() => Loginscreen());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Registration failed';
    }
  }
}
