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
  final snack = const SnackBar(
    content: Text('Success  Registration successful!'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Colors.white,
            // Colors.white,
            // Color.fromARGB(255, 219, 253, 179),
            // Color.fromARGB(255, 203, 248, 151),
            // Color.fromARGB(255, 196, 247, 138),
            // Color.fromARGB(255, 204, 255, 146),
            // Color.fromARGB(255, 196, 247, 138),
            // Color.fromARGB(255, 188, 249, 118),
            // //Colors.white,
            // Color.fromARGB(255, 165, 249, 69),
            // Color.fromARGB(255, 154, 254, 39),
            Colors.deepPurple.shade100,
            Colors.deepPurple.shade200,
            Colors.deepPurple.shade400,
            Colors.deepPurple,
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
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Placeholder(
                        child: smallText16('The Logo'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        customTextField(_signInController.signInEmailController,
                            keyboardType: TextInputType.emailAddress,
                            leadingIcon: Icons.mail,
                            lableText: 'Email'),
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
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          )
                        : const SizedBox.shrink()),
                    const SizedBox(height: 16),
                    Obx(() => _signInController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : largeButton(
                            theText: 'Login',
                            onTapped: () {
                              _signInController.signIn();

                              // _signInController.signInEmailController.clear();
                              // _signInController.signInPasswordController
                              //     .clear();
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
