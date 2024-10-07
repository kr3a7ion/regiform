import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';
import 'package:regiform/views/home/model/dropdown_list.dart';
import 'package:regiform/views/home/widget/custom_dropdown.dart';

final Homecontroller _homecontroller = Get.put(Homecontroller());
const double dropdownborderHeight = 70;
const double hintTextsize = 16;
const double theIconSize = 30;

// Gender DropDown
Widget customDropdownGender() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Select Gender',
      value: _homecontroller.genderSelect.value,
      dropdownItems: genderItems,
      onChanged: (value) {
        _homecontroller.genderSelect.value = value!;
      }));
}

// Nationality Dropdown
Widget customDropdownSelectCountry() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      dropdownHeight: 600,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Nationality',
      value: _homecontroller.countrySelect.value,
      dropdownItems: countries,
      onChanged: (value) {
        _homecontroller.countrySelect.value = value!;
      }));
}

// Country of Residence Dropdown
Widget customDropdownResidency() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      dropdownHeight: 600,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Country of Residence',
      value: _homecontroller.countrySelect.value,
      dropdownItems: countries,
      onChanged: (value) {
        _homecontroller.countrySelect.value = value!;
      }));
}

// Marital Status
Widget customDropdownMaritalStatus() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Marital Status',
      value: _homecontroller.maritalStatusSelect.value,
      dropdownItems: maritalStatusSelect,
      onChanged: (value) {
        _homecontroller.maritalStatusSelect.value = value!;
      }));
}


// Numbers of Rooms
Widget customDropdownNumberofRooms() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Number of rooms',
      value: _homecontroller.numberRooms.value,
      dropdownItems: numberOfRoom,
      onChanged: (value) {
        _homecontroller.numberRooms.value = value!;
      }));
}


// Numbers of Guest
Widget customDropdownNumberofGuest() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Number of Guest',
      value: _homecontroller.numberOfGuest.value,
      dropdownItems: numberOfGuest,
      onChanged: (value) {
        _homecontroller.numberOfGuest.value = value!;
      }));
}


// Payment Method
Widget customDropdownPaymentMethod() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: dropdownborderHeight,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: theIconSize,
        color: custompurpleColor,
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 20),
      buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: borderColor),
          color: Colors.white),
      hint: 'Payment Method',
      value: _homecontroller.paymentMethod.value,
      dropdownItems: listOfPaymentOptions,
      onChanged: (value) {
        _homecontroller.paymentMethod.value = value!;
      }));
}
