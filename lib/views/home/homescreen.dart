import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/views/home/controllers/home_controller.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final SignInController _signInController = Get.put(SignInController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            largeButton(
                theText: 'Log out',
                onTapped: () {
                  _signInController.signOutUser();
                }),
            Container(
              height: 200,
              width: 200,
              color: Colors.grey,
              child: Center(
                child: Text(
                    "Welcome ${_homeController.currentUserData.isNotEmpty ? _homeController.currentUserData.value : _signInController.currentUserName.value}",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
