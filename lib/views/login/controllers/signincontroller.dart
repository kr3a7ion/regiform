// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:regiform/views/home/controllers/home_controller.dart';
import 'package:regiform/views/home/homescreen.dart';
import 'package:regiform/views/login/loginscreen.dart';
import 'package:regiform/views/login/model/signinvalidator.dart';
import 'package:regiform/views/login/model/user_data_model.dart';
import 'package:regiform/views/login/model/user_model.dart';

class SignInController extends GetxController {
  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  final HomeController _homeController = Get.put(HomeController());

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
  var currentUserName = ''.obs;

  // Define the timeout duration (e.g., 10 seconds)
  final Duration _loginTimeoutDuration = const Duration(seconds: 10);

  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
      currentUserName.value = '';
      Get.offAll(() => Loginscreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3));
    }
  }

  Future<void> currentUser() async {
    try {
      // Get the current user and proceed only if the user is successfully logged in

      User? user = _auth.currentUser;

      if (user != null) {
        
        var userData = await _fetchUserDataModel.fetchUserData();
        DisplayUserData displayUserData = DisplayUserData.fromMap(userData!);
        if (displayUserData.userName == null) {
          errorMessage.value = 'An error occured';
          throw Exception('user data not found');
        }
        if (user.email == displayUserData.email) {
          currentUserName.value = displayUserData.userName!;
        } else {
          errorMessage.value = 'An error occured';
          throw Exception('email mismatch');
        }
      }
      // Navigate to the home screen or another appropriate screen
      currentUserName.value = signInEmailController.text.trim();
      Get.offAll(() => HomeScreen());
      isLoading.value = false;
      signInEmailController.clear();
      signInPasswordController.clear();
      Future.delayed(const Duration(seconds: 5), () {
        _homeController.getCurrentUser();
      });
    } catch (e) {
      // Navigate to the home screen or another appropriate screen
      print('AM HERE NOW $e');
      currentUserName.value = signInEmailController.text.trim();
      Get.offAll(() => HomeScreen());
      isLoading.value = false;
      signInEmailController.clear();
      signInPasswordController.clear();
      theloginFirbaseError.value =
          'Oops! try again, we encountered an error $e';
      Future.delayed(const Duration(seconds: 5), () {
        _homeController.getCurrentUser();
      });
    }
  }

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
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await Future.any([
        _auth.signInWithEmailAndPassword(
          email: signInEmailController.text.trim(),
          password: signInPasswordController.text.trim(),
        ),
        Future.delayed(_loginTimeoutDuration, () {
          throw TimeoutException(
              'Login timeout. Please check your internet connection and try again.');
        })
      ]);

      currentUser();
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth-specific errors
      theloginFirbaseError.value = e.code;
      errorMessage.value = e.message ?? 'An unknown error occurred.';
      isLoading.value = false;
    } on TimeoutException {
      // Handle login timeout
      isLoading.value = false;
      errorMessage.value =
          'Login timeout. Please check your internet connection and try again.';
    } finally {
      isLoading.value = false;
    }
  }
}
