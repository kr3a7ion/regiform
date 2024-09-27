import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/common/widgets/frostybackground.dart';
import 'package:regiform/views/forgetpassword/forgetpassword.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';
import 'package:regiform/views/signup/signup.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  final SignInController _signInController = Get.put(SignInController());

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
                fit: BoxFit.fill)),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: frostyBackground(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //const SizedBox(height: 20),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Placeholder(
                            child: smallText16('The Logo'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        smallText16('L O G I N',
                            theColor: customPurpleColor2,
                            theSize: 30,
                            theFontWeight: FontWeight.w800),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            customTextField(
                                _signInController.signInEmailController,
                                keyboardType: TextInputType.emailAddress,
                                leadingIcon: Icons.mail,
                                lableText: 'Email'),
                            const SizedBox(height: 20),
                            customPasswordTextField(
                              _signInController.signInPasswordController,
                            ),
                            const SizedBox(height: 15),
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
                        const SizedBox(height: 10),
                        Obx(() => _signInController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : largeButton(
                                theText: 'Login',
                                onTapped: () {
                                  _signInController.signIn();
                                },
                              )),
                        //const SizedBox(height: 20),
                      ],
                    ),
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
