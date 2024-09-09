import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/views/forgetpassword/controller/forgetpasswordcontroller.dart';

class Forgetpassword extends StatelessWidget {
  Forgetpassword({super.key});

  final ForgetPasswordController _resetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // // Colors.white,
            // Colors.orangeAccent,
            Colors.deepPurple.shade100,
            Colors.deepPurple.shade200,
            Colors.deepPurple.shade400,
            Colors.deepPurple,
          ],
        )),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  smallText16('F O R G E T ',
                      theSize: 30,
                      theColor: Colors.white,
                      theFontWeight: FontWeight.bold),
                  smallText16('P A S S W O R D',
                      theSize: 30,
                      theColor: Colors.white,
                      theFontWeight: FontWeight.bold),
                  const SizedBox(height: 40),
                  customTextField(
                      _resetPasswordController.forgetPasswordController,
                      lableText: 'Email',
                      leadingIcon: Icons.mail,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 20),
                  Obx(() => _resetPasswordController.errorMessage.isNotEmpty
                      ? Text(
                          _resetPasswordController.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const SizedBox.shrink()),
                  const SizedBox(height: 16),
                  Obx(() => _resetPasswordController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : largeButton(
                          theText: 'Reset',
                          onTapped: () {
                            _resetPasswordController.resetPassword();
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
    );
  }
}
