import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:regiform/common/widgets/customdatepicker.dart';
import 'package:regiform/common/widgets/showsnackbar.dart';
import 'package:regiform/views/home/controllers/validator_class.dart';
import 'package:regiform/views/home/model/formdb_model.dart';
import 'package:regiform/views/login/controllers/signincontroller.dart';

final SignInController _signInController = Get.put(SignInController());
final DatePickerControlleler _datePickerControlleler =
    Get.put(DatePickerControlleler());

class Homecontroller extends GetxController {
  // Personal details
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController otherNamesController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passportIDController = TextEditingController();
  final TextEditingController visaValidityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Company details
  final TextEditingController companyController = TextEditingController();

  // Arrival and stay details
  final TextEditingController arrivalDateController = TextEditingController();
  final TextEditingController arrivalTimeController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController comingFromController = TextEditingController();
  final TextEditingController goingToController = TextEditingController();
  final TextEditingController roomTypeController = TextEditingController();
  final TextEditingController roomRateController = TextEditingController();
  final TextEditingController noOfRoomsController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController noOfGuestsController = TextEditingController();
  final TextEditingController depositedController = TextEditingController();

  // final Authcontroller _auth = Get.put(Authcontroller());
  final GuestFormData _formData = Get.put(GuestFormData());

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // dropdown values
  var genderSelect = RxnString();
  var countrySelect = RxnString();
  var maritalStatusSelect = RxnString();
  var numberRooms = RxnString();
  var numberOfGuest = RxnString();
  var paymentMethod = RxnString();
  

  //
  var personalDetailsDone = true.obs;
  var identificationDetailsDone = false.obs;
  var addressDetailsDone = false.obs;
  var travelDetailsDone = false.obs;
  var accomodationDetailsDone = false.obs;
  var paymentDetailsDone = false.obs;
  var signatureDetailsDone = false.obs;

  //@override
  // void onClose() {
  //   firstNameController.dispose();
  //   otherNamesController.dispose();
  //   lastNameController.dispose();
  //   dateOfBirthController.dispose();
  //   sexController.dispose();
  //   mobileNoController.dispose();
  //   emailController.dispose();
  //   passportIDController.dispose();
  //   visaValidityController.dispose();
  //   addressController.dispose();
  //   companyController.dispose();
  //   arrivalDateController.dispose();
  //   arrivalTimeController.dispose();
  //   departureTimeController.dispose();
  //   departureDateController.dispose();
  //   comingFromController.dispose();
  //   goingToController.dispose();
  //   roomTypeController.dispose();
  //   roomRateController.dispose();
  //   noOfRoomsController.dispose();
  //   apartmentController.dispose();
  //   noOfGuestsController.dispose();
  //   depositedController.dispose();
  //   super.onClose();
  // }

  void completionStatus(int thePageIndex) {
    if (thePageIndex == 1 && identificationDetailsDone.value == true) {
      identificationDetailsDone = false.obs;
      addressDetailsDone = false.obs;
      travelDetailsDone = false.obs;
      accomodationDetailsDone = false.obs;
      paymentDetailsDone = false.obs;
      signatureDetailsDone = false.obs;
    }
    if (thePageIndex == 2 && addressDetailsDone.value == true) {
      addressDetailsDone = false.obs;
      travelDetailsDone = false.obs;
      accomodationDetailsDone = false.obs;
      paymentDetailsDone = false.obs;
      signatureDetailsDone = false.obs;
    }
    if (thePageIndex == 3 && travelDetailsDone.value == true) {
      travelDetailsDone = false.obs;
      accomodationDetailsDone = false.obs;
      paymentDetailsDone = false.obs;
      signatureDetailsDone = false.obs;
    }
    if (thePageIndex == 4 && accomodationDetailsDone.value == true) {
      accomodationDetailsDone = false.obs;
      paymentDetailsDone = false.obs;
      signatureDetailsDone = false.obs;
    }
    if (thePageIndex == 5 && paymentDetailsDone.value == true) {
      paymentDetailsDone = false.obs;
      signatureDetailsDone = false.obs;
    }
    if (thePageIndex == 6 && signatureDetailsDone.value == true) {
      signatureDetailsDone = false.obs;
    }

    //
    if (thePageIndex == 2) {
      identificationDetailsDone.value = true;
    } else if (thePageIndex == 3) {
      addressDetailsDone.value = true;
    } else if (thePageIndex == 4) {
      travelDetailsDone.value = true;
    } else if (thePageIndex == 5) {
      accomodationDetailsDone.value = true;
    } else if (thePageIndex == 6) {
      paymentDetailsDone.value = true;
    } else if (thePageIndex == 7) {
      signatureDetailsDone.value = true;
    }
  }

  bool validator() {
    final firstNameError =
        FormValidator.validatefirstname(firstNameController.text.trim());
    if (firstNameError != null) {
      errorMessage.value = firstNameError;
      return false;
    }

    final otherNameError =
        FormValidator.validateothernames(otherNamesController.text.trim());
    if (otherNameError != null) {
      errorMessage.value = otherNameError;
      return false;
    }

    final lastNameError =
        FormValidator.validatelastname(lastNameController.text.trim());
    if (lastNameError != null) {
      errorMessage.value = lastNameError;
      return false;
    }

    final dateofbirthError = FormValidator.validateDOB(_datePickerControlleler.selectedDOBDate.value);
    if (dateofbirthError != null) {
      errorMessage.value = dateofbirthError;
      return false;
    }

    final emailError = FormValidator.validateEmail(emailController.text.trim());
    if (emailError != null) {
      errorMessage.value = emailError;
      return false;
    }

    final addressError =
        FormValidator.validateAddress(addressController.text.trim());
    if (addressError != null) {
      errorMessage.value = addressError;
      return false;
    }

    final passportIDError =
        FormValidator.validatePassportID(passportIDController.text.trim());
    if (passportIDError != null) {
      errorMessage.value = passportIDError;
      return false;
    }

    final sexError = FormValidator.validateSex(genderSelect.value.toString());
    if (sexError != null) {
      errorMessage.value = sexError;
      return false;
    }

    final mobileError =
        FormValidator.validateMobile(mobileNoController.text.trim());
    if (mobileError != null) {
      errorMessage.value = mobileError;
      return false;
    }

    //
    errorMessage.value = '';
    return true;
  }

  void onFormSaved() async {
    if (errorMessage.value.isNotEmpty) {
      showSnackbar('Error', errorMessage.value);
    }

    if (!validator()) {
      return;
    }

    try {
      if (_signInController.uID.isEmpty) {
        throw Exception('User data not complete');
      }
      _formData.uid = _signInController.uID.value;
      _formData.firstname = firstNameController.text.trim();
      _formData.othernames = otherNamesController.text.trim();
      _formData.lastname = lastNameController.text.trim();
      _formData.dateofbirth = dateOfBirthController.text.trim();
      _formData.sex = genderSelect.value;
      _formData.mobile = mobileNoController.text.trim();
      _formData.email = emailController.text.trim();
      _formData.passportId = passportIDController.text.trim();
      _formData.address = addressController.text.trim();

      var guestFormData = await _formData.createFormData();

      if (guestFormData) {
        showSnackbar('Success', 'Registration Saved Succesfully');
      }
    } on FirebaseException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Registration failed';
    } finally {
      isLoading.value = false;
    }
  }
}
