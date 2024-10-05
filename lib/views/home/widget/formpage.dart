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

const double textFieldHieght = 70;
const double textfieldFontSize = 16;
const double thelableFontSize = 16;
const double theIconSize = 20;
const double theHeadSpace = 30;
const double headerFontSize = 16;

// This first widget is the first welcome text
Widget customWelcome(
  BuildContext context,
  PageController theController,
) {
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
  PageController theController,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),

        // Personal Section
        smallText16('P E R S O N A L - D E T A I L S',
            theSize: headerFontSize,
            theColor: custompurpleColor,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: customTextField(
                keyboardType: TextInputType.text,
                theHeight: textFieldHieght,
                homecontroller.nameTextController,
                lableText: 'First name',
                leadingIcon: Icons.person_2,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: customTextField(
                keyboardType: TextInputType.text,
                theHeight: textFieldHieght,
                homecontroller.nameTextController,
                lableText: 'Other names',
                leadingIcon: Icons.person_2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          keyboardType: TextInputType.text,
          theHeight: textFieldHieght,
          homecontroller.nameTextController,
          lableText: 'Last name',
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
        Row(
          children: [
            Expanded(child: customDataPicter(context: context)),
            const SizedBox(width: 15),
            Expanded(child: customDropdownSelectCountry()),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: customDropdownGender()),
            const SizedBox(width: 15),
            Expanded(child: customDropdownMaritalStatus()),
          ],
        ),

        SizedBox(height: 80)
      ],
    ),
  );
}

Widget customregformPage01(
  BuildContext context,
  PageController theController,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),

        // Identification Section
        smallText16('I D E N T I F I C A T I O N - D E T A I L S',
            theSize: headerFontSize,
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
  PageController theController,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),

        // Address Section
        smallText16('A D D R E S S - D E T A I L S',
            theSize: headerFontSize,
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
  PageController theController,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),

        // Address Section
        smallText16('T R A V E L - D E T A I L S',
            theSize: headerFontSize,
            theColor: custompurpleColor,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: customDataPicter(
                  context: context,
                  labelText: 'Arrival Date',
                  leadingIcon: FontAwesomeIcons.calendarDay),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: customTimePicker(
                  context: context,
                  labelText: 'Arrival Time',
                  leadingIcon: FontAwesomeIcons.clock),
            ),
          ],
        ),

        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: customDataPicter(
                  context: context,
                  labelText: 'Departure Date',
                  leadingIcon: FontAwesomeIcons.calendarCheck),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: customTimePicker(
                  context: context,
                  labelText: 'Departure Time',
                  leadingIcon: FontAwesomeIcons.clock),
            ),
          ],
        ),

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
  PageController theController,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),
        const SizedBox(height: 15),
        smallText16('A C C O M O D A T I O N  D E T A I L S',
            theSize: headerFontSize,
            theColor: customPurpleColor2,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.nameTextController,
          lableText: 'Room Type',
          leadingIcon: Icons.bed,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: customTextField(
                theHeight: textFieldHieght,
                homecontroller.emailTextController,
                lableText: 'Room Rate',
                leadingIcon: Icons.bed,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: customTextField(
                theHeight: textFieldHieght,
                homecontroller.addressTextController,
                lableText: 'No. of Rooms',
                leadingIcon: Icons.bed,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.emailTextController,
          lableText: 'Apartment',
          leadingIcon: Icons.door_front_door,
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.emailTextController,
          lableText: 'No. of Guest',
          leadingIcon: Icons.family_restroom_sharp,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

//
Widget customregformPage4(
  BuildContext context,
  PageController theController,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),
        const SizedBox(height: 15),
        smallText16('P A Y M E N T  D E T A I L S',
            theSize: headerFontSize,
            theColor: customPurpleColor2,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.nameTextController,
          lableText: 'Deposited',
          leadingIcon: Icons.person_2,
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          theHeight: textFieldHieght,
          homecontroller.emailTextController,
          lableText: 'Payment Method',
          leadingIcon: Icons.email,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

//

Widget customregformPage5(
  BuildContext context,
  PageController theController,
  int theIndex,
) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: theHeadSpace,
        ),
        const SizedBox(height: 15),
        smallText16('S I G N A T U R E  D E T A I L S',
            theSize: headerFontSize,
            theColor: customPurpleColor2,
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        smallText16(
          'Guest Signature',
          theColor: custompurpleColor,
          theSize: 16,
        ),
        const SizedBox(
          height: 15,
        ),
        smallText16(
          'Receptionist Signature',
          theColor: custompurpleColor,
          theSize: 16,
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
  return thePageIndex == 5
      ? largeOutlinedButton(
          thewidth: 100,
          theText: 'Save',
          onTapped: () {},
        )
      : const SizedBox.shrink();
}
