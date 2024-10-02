import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/common/widgets/applogo.dart';
import 'package:regiform/common/widgets/frostybackground.dart';
import 'package:regiform/views/login/loginscreen.dart';
import 'package:regiform/views/signup/controllers/signup_controller.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final SignUpController _signUpController = Get.put(SignUpController());

  final Color customPurpleColor2 = const Color(0xff4D1285);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/newbk.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: frostyBackground(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      appLogo(),
                      const SizedBox(height: 20),
                      smallText16('R E G I S T R A T I O N',
                          theSize: 30,
                          theColor: custompurpleColor,
                          theFontWeight: FontWeight.w900),
                      const SizedBox(height: 20),
                      customTextField(_signUpController.usernameController,
                          keyboardType: TextInputType.name),
                      const SizedBox(height: 20),
                      customTextField(
                          lableText: 'Email',
                          leadingIcon: Icons.mail,
                          _signUpController.emailController,
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 20),
                      customPasswordTextField(
                        _signUpController.passwordController,
                      ),
                      const SizedBox(height: 20),
                      customPasswordTextField(
                          _signUpController.confirmPasswordController,
                          lableText: 'Confirm passowrd'),
                      const SizedBox(height: 12),
                      clickableText(
                          ontapped: () {
                            Get.offAll(() => Loginscreen());
                          },
                          theText: "Have account? Sign in!"),
                      const SizedBox(height: 20),
                      Obx(() => _signUpController.errorMessage.isNotEmpty
                          ? Text(
                              _signUpController.errorMessage.value,
                              style: const TextStyle(color: Colors.black),
                            )
                          : const SizedBox.shrink()),
                      const SizedBox(height: 16),
                      Obx(() => _signUpController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : largeButton(
                              theText: 'Sign up',
                              onTapped: () {
                                _signUpController.signUp();
                              },
                            )),
                      const SizedBox(height: 20),
                      largeOutlinedButton(
                          theText: 'Go back',
                          onTapped: () {
                            Get.back();
                          }),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
