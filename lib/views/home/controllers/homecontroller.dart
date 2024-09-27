import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:regiform/common/controllers/authcontroller.dart';
import 'package:regiform/views/home/controllers/validator_class.dart';
import 'package:regiform/views/home/model/formdb_model.dart';

class Homecontroller extends GetxController {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final passpordIDTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final sexTextController = TextEditingController();

  final Authcontroller _auth = Get.put(Authcontroller());
  final GuestFormData _formData = Get.put(GuestFormData());

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var uID = ''.obs;

  @override
  void onInit() {
    uID.value = _auth.authIn.currentUser!.uid;
    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    addressTextController.dispose();
    passpordIDTextController.dispose();
    mobileTextController.dispose();
    super.onClose();
  }

  bool validator() {
    final fullNameError =
        FormValidator.validatefullname(nameTextController.text.trim());
    if (fullNameError != null) {
      errorMessage.value = fullNameError;
      return false;
    }

    final emailError =
        FormValidator.validateEmail(emailTextController.text.trim());
    if (emailError != null) {
      errorMessage.value = emailError;
    }

    final addressError =
        FormValidator.validateAddress(addressTextController.text.trim());
    if (addressError != null) {
      errorMessage.value = addressError;
    }

    final passportIDError =
        FormValidator.validatePasspordID(passpordIDTextController.text.trim());
    if (passportIDError != null) {
      errorMessage.value = passportIDError;
    }

    final sexError = FormValidator.validateSex(sexTextController.text.trim());
    if (sexError != null) {
      errorMessage.value = sexError;
    }

    final mobileError =
        FormValidator.validateMobile(mobileTextController.text.trim());
    if (mobileError != null) {
      errorMessage.value = mobileError;
    }

    //
    errorMessage.value = '';
    return true;
  }

  void onFormSaved() async {
    if (!validator()) {
      return;
    }

    try {
      isLoading.value = true;
      _formData.uid = uID.value;
      _formData.email = emailTextController.text.trim();
      _formData.fullname = nameTextController.text.trim();
      _formData.address = addressTextController.text.trim();
      _formData.passportId = passpordIDTextController.text.trim();
      _formData.sex = sexTextController.text.trim();
      _formData.mobile = mobileTextController.text.trim();

      if (uID.isEmpty) {
        throw Exception('User data not complete');
      }
      await _formData.createFormData();
      Get.snackbar('Success', 'Registration successful!',
          snackPosition: SnackPosition.BOTTOM, snackStyle: SnackStyle.FLOATING);
      //Get.offAll(() => Loginscreen());
    } on FirebaseException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Registration failed';
    } finally {
      isLoading.value = false;
    }
  }
}
