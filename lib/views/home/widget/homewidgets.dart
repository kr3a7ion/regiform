import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';
import 'package:regiform/views/home/model/dropdown_list.dart';
import 'package:regiform/views/home/widget/custom_dropdown.dart';

final Homecontroller _homecontroller = Get.put(Homecontroller());

// Gender DropDown
Widget customDropdownGender() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: 55,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: 30,
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

// Country Dropdown
Widget customDropdownSelectCountry() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: 55,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      dropdownHeight: 600,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: 30,
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
      hint: 'Select Country',
      value: _homecontroller.countrySelect.value,
      dropdownItems: countries,
      onChanged: (value) {
        _homecontroller.countrySelect.value = value!;
      }));
}

// Marital Status
Widget customDropdownMaritalStatus() {
  return Obx(() => CustomDropdownButton2(
      buttonHeight: 55,
      buttonWidth: double.infinity,
      dropdownWidth: 300,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: 30,
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
