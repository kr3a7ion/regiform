import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/authcontroller.dart';
import 'package:regiform/common/widgets/showsnackbar.dart';
import 'package:regiform/views/login/controllers/navigator.dart';
import 'package:regiform/views/login/controllers/validator/signinvalidator.dart';
import 'package:regiform/views/login/loginscreen.dart';
// import 'package:regiform/views/login/model/user_data_model.dart';
import 'package:regiform/views/login/model/user_model.dart';

enum AuthProblems {
  userNotFound,
  passwordNotValid,
  networkError,
  loginCredentials,
}

class SignInController extends GetxController {
  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  final Authcontroller _auth = Get.put(Authcontroller());
  final FetchUserDataModel _fetchUserDataModel = FetchUserDataModel();
  AuthProblems? errorType;

  void handleError(e) {
    if (Platform.isAndroid) {
      switch (e) {
        case 'The supplied auth credential is incorrect, malformed or has expired.':
          errorType = AuthProblems.userNotFound;
          break;
        case 'The password is invalid or the user does not have a password.':
          errorType = AuthProblems.passwordNotValid;
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          errorType = AuthProblems.networkError;
          break;
        default:
          errorType = AuthProblems.networkError;
      }
    } else if (Platform.isIOS) {
      switch (e) {
        case 'Error 17011':
          errorType = AuthProblems.userNotFound;
          break;
        case 'Error 17009':
          errorType = AuthProblems.passwordNotValid;
          break;
        case 'Error 17020':
          errorType = AuthProblems.networkError;
          break;
        default:
          errorType = AuthProblems.networkError;
      }
    }

    // Handle Firebase specific errors
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          errorType = AuthProblems.userNotFound;
          break;
        case 'wrong-password':
          errorType = AuthProblems.passwordNotValid;
          break;
        case 'network-request-failed':
          errorType = AuthProblems.networkError;
          break;
      }
    }

    String errorMessage;
    switch (errorType) {
      case AuthProblems.userNotFound:
        errorMessage = 'User not found.';
        break;
      case AuthProblems.passwordNotValid:
        errorMessage = 'Invalid password.';
        break;
      case AuthProblems.networkError:
        errorMessage = 'Check your network connection.';
        break;
      default:
        errorMessage = 'An unknown error occurred. Please try again.';
    }

    this.errorMessage.value = errorMessage;
    showSnackbar('Error', errorMessage);
  }

  @override
  void onClose() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    super.onClose();
  }

  // Define the timeout duration (e.g., 10 seconds)
  final Duration _loginTimeoutDuration = const Duration(seconds: 30);
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var theloginFirbaseError = ''.obs;
  var currentUserName = ''.obs;
  final RxBool userisLoggedIn = false.obs;
  dynamic _userData;

  final String _usernameMapString = 'username';

// Clear cached session during initialization
  void _clearSession() {
    _auth.authIn.signOut();
  }

  Future<void> signOutUser() async {
    try {
      await _auth.authIn.signOut();
      currentUserName.value = '';
      Get.offAll(() => Loginscreen());
    } catch (e) {
      showSnackbar('Error', 'Failed to sign out: ${e.toString()}');
    }
  }

  Future<void> getCurrentUser() async {
    if (userisLoggedIn.value) {
      if (_userData != null) {
        //DisplayUserData displayUserData = DisplayUserData.fromMap(_userData);
        if (_userData['email'] != signInEmailController.text.trim()) {
          _clearSession();
          throw Exception('Email mismatch');
        }
        currentUserName.value = _userData[_usernameMapString] ?? 'Unavailable';
      } else {
        throw Exception('No user logged in');
      }
    } else {
      Get.offAll(() => Loginscreen());
      _clearSession();
      throw Exception('No user');
    }
  }

  Future<void> currentUser() async {
    try {
      // Get the current user and proceed only if the user is successfully logged in
      User? user = _auth.authIn.currentUser;

      if (user != null) {
        isLoading.value = true;

        var userData = await _fetchUserDataModel.fetchUserData();
        _userData = userData;

        if (userData == null) {
          throw Exception('User data not found.');
        }
        // Mark user as logged in only if the data is valid
        userisLoggedIn.value = true;
        await getCurrentUser();
      } else {
        throw Exception('User data not found');
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      theloginFirbaseError.value = e.code;
      errorMessage.value = 'Login Failed';
    } catch (e) {
      handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  void signIn() async {
    if (!validator()) {
      return;
    }
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Ensure the user has fresh credentials
      _clearSession();

      UserCredential userCredential = await _auth.authIn
          .signInWithEmailAndPassword(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim(),
      )
          .timeout(_loginTimeoutDuration, onTimeout: () {
        _clearSession();
        errorMessage.value =
            'Login timeout. Please check your internet connection and try again.';
        throw TimeoutException('Login timeout');
      });
      if (userCredential.user == null) {
        throw Exception(
            'The supplied auth credential is incorrect, malformed or has expired.');
      }

      // Check if the current user and data are valid before navigating
      await currentUser(); // Ensure user data is fetched correctly
      if (userisLoggedIn.value) {
        // Clear the fields only when the user is successfully logged in
        signInEmailController.clear();
        signInPasswordController.clear();
        // Only navigate if logged in is true
        Get.to(() => navigateToScreen());
      }
    } on TimeoutException {
      // Handle login timeout
      errorMessage.value =
          'Login timeout. Please check your internet connection and try again.';
      // } catch (e) {
      //   handleError(e);
    } finally {
      isLoading.value = false;
    }
  }
}
