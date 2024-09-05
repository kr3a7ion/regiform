// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:regiform/views/home/homescreen.dart';
import 'package:regiform/views/login/model/signinvalidator.dart';
import 'package:regiform/views/login/model/user_data_model.dart';
import 'package:regiform/views/login/model/user_model.dart';

class SignInController extends GetxController {
  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FetchUserDataModel _fetchUserDataModel = FetchUserDataModel();

  @override
  void onClose() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    super.onClose();
  }

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var theloginFirbaseError = ''.obs;

  // login form submission
  bool validator() {
    final emailError =
        SignInValidator.validateEmail(signInEmailController.text.trim());
    if (emailError != null) {
      errorMessage.value = emailError;
      return false;
    }

    final passwordError =
        SignInValidator.validatePassword(signInPasswordController.text.trim());
    if (passwordError != null) {
      errorMessage.value = passwordError;
      return false;
    }

    errorMessage.value = '';
    return true;
  }

  void signIn() async {
    if (!validator()) {
      return;
    }
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim(),
      );
      User? user = userCredential.user;

      if (user != null) {
        var userData = await _fetchUserDataModel.fetchUserData();
        DisplayUserData displayUserData = DisplayUserData.fromMap(userData!);
        // Navigate to the home screen or another appropriate screen
        Get.offAll(() => HomeScreen(user: displayUserData));
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      theloginFirbaseError.value = e.code;
      errorMessage.value = 'Login Failed';
    }
  }
}
