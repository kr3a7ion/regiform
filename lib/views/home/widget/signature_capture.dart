import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/views/home/controllers/signaturecontroller.dart';
import 'package:signature/signature.dart';

final MySignatureControlles _mySignatureControlles =
    Get.put(MySignatureControlles());

// This widget capture guest Signature from forms
Widget captureSignature() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 350,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Signature(
          controller: _mySignatureControlles.guestSignatureController,
          key: const Key('guest signature'),
          height: 330,
          backgroundColor: Colors.white,
        ),
      ),
      SizedBox(height: 20),
      Obx(
        () => _mySignatureControlles.isSignatureEmpty.value
            ? smallText16(
                'No Signature',
                theColor: Colors.red,
              )
            : smallText16(
                'Signature Captured',
                theColor: Colors.green,
              ),
      )
    ],
  );
}

// This Widget capture signature during user Signup
Widget signupcaptureSignature() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 350,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Signature(
          controller: _mySignatureControlles.signupSignatureController,
          key: const Key('user signature'),
          height: 330,
          backgroundColor: Colors.white,
        ),
      ),
      SizedBox(height: 20),
      Obx(
        () => _mySignatureControlles.isSignupSignatureEmpty.value
            ? smallText16(
                'No Signature',
                theColor: Colors.red,
              )
            : smallText16(
                'Signature Captured',
                theColor: Colors.green,
              ),
      )
    ],
  );
}
