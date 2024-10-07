import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:regiform/common/widgets/showsnackbar.dart';
import 'package:regiform/views/home/widget/sign_widget.dart';
import 'package:signature/signature.dart';

class MySignatureControlles extends GetxController {
  final SignatureController guestSignatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    onDrawStart: () => log('onDrawStart called!'),
    onDrawEnd: () => log('onDrawEnd called!'),
  );

  final SignatureController signupSignatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    onDrawStart: () => log('onDrawStart called!'),
    onDrawEnd: () => log('onDrawEnd called!'),
  );

  RxBool isSignatureEmpty = true.obs;
  RxBool isSignupSignatureEmpty = true.obs;

  @override
  void onInit() {
    super.onInit();
    guestSignatureController.addListener(() {
      log('Value changed');
      isSignatureEmpty.value = guestSignatureController.isEmpty;
    });
  }

  @override
  void onClose() {
    guestSignatureController.disabled;
    signupSignatureController.disabled;
    super.onClose();
  }

  void clear() => guestSignatureController.clear();
  void clearsignup() => guestSignatureController.clear();

  Future<void> exportGuestSignatureToUI() async {
    if (guestSignatureController.isEmpty) {
      showSnackbar('Error', 'Signature field is empty');
      return;
    }
    //
    final Uint8List? data =
        await guestSignatureController.toPngBytes(height: 1000, width: 1000);
    if (data == null) {
      return;
    }

    signWidget(data: data);
  }

  Future<void> exportSignupSignatureToUI() async {
    if (signupSignatureController.isEmpty) {
      showSnackbar('Error', 'Signature field is empty');
      return;
    }
    //
    final Uint8List? data =
        await signupSignatureController.toPngBytes(height: 1000, width: 1000);
    if (data == null) {
      return;
    }
  }
}
