import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/views/forgetpassword/forgetpassword.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';
import 'package:regiform/views/signup/signup.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.orangeAccent,
          ],
        )),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 80,
                      width: 80,
                      color: Colors.deepOrangeAccent,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        customTextField(
                          _signInController.signInEmailController,
                        ),
                        const SizedBox(height: 20),
                        customPasswordTextField(
                          _signInController.signInPasswordController,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: clickableText(
                                  ontapped: () {
                                    Get.to(() => Signup());
                                  },
                                  theText: "No account? Sign up!"),
                            ),
                            Flexible(
                              child: clickableText(ontapped: () {
                                Get.to(() => Forgetpassword());
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Obx(() => _signInController.errorMessage.isNotEmpty
                        ? Text(
                            _signInController.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox.shrink()),
                    const SizedBox(height: 16),
                    Obx(() => _signInController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : largeButton(
                            theText: 'Login',
                            onTapped: () {
                              _signInController.signIn();
                            },
                          )),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
