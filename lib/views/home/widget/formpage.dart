import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/common/widgets/customdatepicker.dart';
import 'package:regiform/common/widgets/customtimepicker.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regiform/views/home/widget/homewidgets.dart';

final Homecontroller homecontroller = Get.put(Homecontroller());
const double textFieldHieght = 55;

// This first widget is the first welcome text
Widget customWelcome(BuildContext context, PageController theController,
    {int theIndex = 0}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      smallText16(
        'W E L C O M E',
        theColor: custompurpleColor,
        theSize: 50,
      ),
    ],
  );
}

/// This Wiget Page 1, 01, 02, Covers Personal details
/// Identification detals and Address
/// Informations widgets
///
Widget customregformPage1(
  BuildContext context,
  PageController theController, {
  int theIndex = 0,
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),

        // Personal Section
        smallText16('P E R S O N A L - D E T A I L S',
            theSize: 16,
            theColor: custompurpleColor,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        customTextField(
          keyboardType: TextInputType.text,
          theHeight: textFieldHieght,
          homecontroller.nameTextController,
          lableText: 'Fullname',
          leadingIcon: Icons.person_2,
        ),
        const SizedBox(
          height: 15,
        ),

        customTextField(
          keyboardType: TextInputType.emailAddress,
          theHeight: textFieldHieght,
          homecontroller.emailTextController,
          lableText: 'Email',
          leadingIcon: Icons.email,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.phone,
          theHeight: textFieldHieght,
          homecontroller.nameTextController,
          lableText: 'Mobile number',
          leadingIcon: Icons.phone_android,
        ),
        const SizedBox(height: 15),
        customDataPicter(context: context),
        const SizedBox(height: 15),
        customDropdownGender(),
        const SizedBox(height: 15),
        customDropdownMaritalStatus(),
        const SizedBox(height: 15),
        customDropdownSelectCountry(),
        const SizedBox(height: 15),

        SizedBox(height: 80)
      ],
    ),
  );
}

Widget customregformPage01(
  BuildContext context,
  PageController theController, {
  int theIndex = 0,
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),

        // Identification Section
        smallText16('I D E N T I F I C A T I O N - D E T A I L S',
            theSize: 16,
            theColor: custompurpleColor,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.text,
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Passport ID',
          leadingIcon: FontAwesomeIcons.idCardClip,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.text,
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Visa Validity',
          leadingIcon: FontAwesomeIcons.passport,
        ),
        const SizedBox(height: 15),
        customDropdownResidency(), // Note to self Possible update to make this searchable dropdown
      ],
    ),
  );
}

Widget customregformPage02(
  BuildContext context,
  PageController theController, {
  int theIndex = 0,
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),

        // Address Section
        smallText16('A D D R E S S - D E T A I L S',
            theSize: 16,
            theColor: custompurpleColor,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.streetAddress,
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Address',
          leadingIcon: FontAwesomeIcons.city,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.streetAddress,
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Company',
          leadingIcon: FontAwesomeIcons.buildingColumns,
        ),
      ],
    ),
  );
}

///
///This widget Page2 Covers the Travel detail widgets
///
Widget customregformPage2(
  BuildContext context,
  PageController theController, {
  int theIndex = 0,
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),

        // Address Section
        smallText16('T R A V E L - D E T A I L S',
            theSize: 16,
            theColor: custompurpleColor,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 15),
        customDataPicter(
            context: context,
            labelText: 'Arrival Date',
            leadingIcon: FontAwesomeIcons.calendarDay),
        const SizedBox(height: 15),
        customTimePicker(
            context: context,
            labelText: 'Arrival Time',
            leadingIcon: FontAwesomeIcons.clock),
        const SizedBox(height: 15),
        customDataPicter(
            context: context,
            labelText: 'Departure Date',
            leadingIcon: FontAwesomeIcons.calendarCheck),
        const SizedBox(height: 15),
        customTimePicker(
            context: context,
            labelText: 'Departure Time',
            leadingIcon: FontAwesomeIcons.clock),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.streetAddress,
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Coming from where?',
          leadingIcon: FontAwesomeIcons.map,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.streetAddress,
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Going to where?',
          leadingIcon: FontAwesomeIcons.map,
        ),
        const SizedBox(height: 80),
      ],
    ),
  );
}

//

Widget customregformPage3(
  BuildContext context,
  PageController theController, {
  int theIndex = 0,
  String theHeaderText = '',
}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        const SizedBox(height: 15),
        smallText16(theHeaderText,
            theSize: 14,
            theColor: customPurpleColor2,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.nameTextController,
          lableText: 'Fullname',
          leadingIcon: Icons.person_2,
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.emailTextController,
          lableText: 'Email',
          leadingIcon: Icons.email,
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.addressTextController,
          lableText: 'Address',
          leadingIcon: Icons.location_city,
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 40),
          child: _nextButton(theIndex, context, theController),
        ),
      ],
    ),
  );
}

//
Widget _nextButton(
  int thePageIndex,
  BuildContext context,
  PageController thePageController,
) {
  return Column(
    children: [
      thePageIndex < 6
          ? const SizedBox(
              height: 0,
            )
          : const SizedBox(
              height: 30,
            ),
      //

      thePageIndex == 6
          ? largeOutlinedButton(
              thewidth: 100,
              theText: 'Save',
              onTapped: () {},
            )
          : const SizedBox.shrink(),
    ],
  );
}
