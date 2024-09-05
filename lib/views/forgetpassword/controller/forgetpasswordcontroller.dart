import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/views/forgetpassword/controller/validator.dart';
import 'package:regiform/views/login/loginscreen.dart';

class ForgetPasswordController extends GetxController {
  final forgetPasswordController = TextEditingController();

  @override
  void onClose() {
    forgetPasswordController.dispose();
    super.onClose();
  }

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  bool validator() {
    final emailError = ResetPasswordValidator.validateEmail(
        forgetPasswordController.text.trim());
    if (emailError != null) {
      errorMessage.value = emailError;
      return false;
    }

    errorMessage.value = '';
    return true;
  }

  Future<void> resetPassword() async {
    if (!validator()) {
      return;
    }
    isLoading.value = true;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetPasswordController.text.trim());
      Get.snackbar('Password Reset Success',
          'If an account with this email exists, a reset link has been sent to it. Please check your email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orangeAccent.shade100,
          barBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          duration: const Duration(seconds: 5));
      Get.offAll(() => Loginscreen());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        errorMessage.value = e.message ?? 'An unexpected error occurred';
        Get.snackbar(
          'Reset Failed',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.shade100,
          barBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          duration: const Duration(seconds: 5),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
