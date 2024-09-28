import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/controllers/authcontroller.dart';

import 'package:regiform/views/home/homescreen.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';
import 'package:regiform/views/login/loginscreen.dart';

Widget navigateToScreen() {
  final Authcontroller auth = Get.put(Authcontroller());
  final SignInController signInController = Get.put(SignInController());
  return StreamBuilder<User?>(
      stream: auth.authIn.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && signInController.userisLoggedIn.value) {
          return HomeScreen();
        } else if (snapshot.hasError ||
            !signInController.userisLoggedIn.value) {
          return Loginscreen();
        } else {
          return Loginscreen();
        }
      });
}
