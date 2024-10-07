import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/common/widgets/customdatepicker.dart';
import 'package:regiform/common/widgets/customtimepicker.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regiform/views/home/controllers/signaturecontroller.dart';
import 'package:regiform/views/home/widget/homewidgets.dart';
import 'package:regiform/views/home/widget/signature_capture.dart';

final Homecontroller homecontroller = Get.put(Homecontroller());
final MySignatureControlles _mySignatureControlles =
    Get.put(MySignatureControlles());
final DatePickerControlleler _datePickerControlleler =
    Get.put(DatePickerControlleler());
final TimePickerController _timePickerController =
    Get.put(TimePickerController());
final Homecontroller _homecontroller = Get.put(Homecontroller());

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
                keyboardType: TextInputType.name,
                theHeight: textFieldHieght,
                homecontroller.firstNameController,
                lableText: 'First name',
                leadingIcon: Icons.person_2,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: customTextField(
                keyboardType: TextInputType.name,
                theHeight: textFieldHieght,
                homecontroller.otherNamesController,
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
          keyboardType: TextInputType.name,
          theHeight: textFieldHieght,
          homecontroller.lastNameController,
          lableText: 'Last name',
          leadingIcon: Icons.person_2,
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          keyboardType: TextInputType.emailAddress,
          theHeight: textFieldHieght,
          homecontroller.emailController,
          lableText: 'Email',
          leadingIcon: Icons.email,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.phone,
          theHeight: textFieldHieght,
          homecontroller.mobileNoController,
          lableText: 'Mobile number',
          leadingIcon: Icons.phone_android,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
                child: customDataPicter(
              context: context,
              onpressed: () {
                showMyDatePicker(
                    context, _datePickerControlleler.selectedDOBDate);
              },
              theController: _homecontroller.dateOfBirthController,
            )),
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
          homecontroller.passportIDController,
          lableText: 'Passport ID',
          leadingIcon: FontAwesomeIcons.idCardClip,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.text,
          theHeight: textFieldHieght,
          homecontroller.visaValidityController,
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
          homecontroller.addressController,
          lableText: 'Address',
          leadingIcon: FontAwesomeIcons.city,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.streetAddress,
          theHeight: textFieldHieght,
          homecontroller.companyController,
          lableText: 'Company',
          leadingIcon: FontAwesomeIcons.buildingColumns,
        ),
      ],
    ),
  );
}

//This widget Page2 Covers the Travel detail widgets
//
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
                  onpressed: () {
                    showMyDatePicker(
                        context, _datePickerControlleler.selectedArrivalDate);
                  },
                  theController: _homecontroller.arrivalDateController,
                  labelText: 'Arrival Date',
                  leadingIcon: FontAwesomeIcons.calendarDay),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: customTimePicker(
                  onpressed: () {
                    showMyTimePicker(context,
                        timeData: _timePickerController.arrivalSelectedTime);
                  },
                  theController: _homecontroller.arrivalTimeController,
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
                  onpressed: () {
                    showMyDatePicker(
                        context, _datePickerControlleler.selectedDepartureDate);
                  },
                  theController: _homecontroller.departureDateController,
                  labelText: 'Departure Date',
                  leadingIcon: FontAwesomeIcons.calendarCheck),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: customTimePicker(
                onpressed: () {
                    showMyTimePicker(context,
                        timeData: _timePickerController.departureSelectedTime);
                  },
                  theController: _homecontroller.departureTimeController,
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
          homecontroller.comingFromController,
          lableText: 'Coming from where?',
          leadingIcon: FontAwesomeIcons.map,
        ),
        const SizedBox(height: 15),
        customTextField(
          keyboardType: TextInputType.streetAddress,
          theHeight: textFieldHieght,
          homecontroller.goingToController,
          lableText: 'Going to where?',
          leadingIcon: FontAwesomeIcons.map,
        ),
        const SizedBox(height: 80),
      ],
    ),
  );
}

//
// This widget covers accomodation details
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
        Row(
          children: [
            Expanded(
              child: customTextField(
                keyboardType: TextInputType.name,
                theHeight: textFieldHieght,
                homecontroller.roomTypeController,
                lableText: 'Room Type',
                leadingIcon: Icons.bed,
              ),
            ),
            SizedBox(width: 15),
            Expanded(child: customDropdownNumberofGuest())
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: customTextField(
                keyboardType: TextInputType.number,
                theHeight: textFieldHieght,
                homecontroller.roomRateController,
                lableText: 'Room Rate',
                leadingIcon: Icons.bed,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(child: customDropdownNumberofRooms()),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        customTextField(
          keyboardType: TextInputType.name,
          theHeight: textFieldHieght,
          homecontroller.apartmentController,
          lableText: 'Apartment',
          leadingIcon: Icons.door_front_door,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

//
// This widget covers payment details
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
          homecontroller.depositedController,
          lableText: 'Deposited',
          leadingIcon: Icons.person_2,
        ),
        const SizedBox(
          height: 15,
        ),
        customDropdownPaymentMethod(),
        const SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

//
// This widget covers Signature capturing
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallText16(
              'Guest Signature: Sign within the white box below!!',
              theColor: custompurpleColor,
              theSize: 18,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                captureSignature(),
                SizedBox(
                  width: 15,
                ),
                Obx(() => _mySignatureControlles.isSignatureEmpty.value
                    ? SizedBox.shrink()
                    : GestureDetector(
                        onTap: () {
                          _mySignatureControlles.clear();
                        },
                        child: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: custompurpleColor,
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                              FittedBox(
                                child: smallText16(
                                  'Clear',
                                  theColor: custompurpleColor,
                                  theSize: 16,
                                  theFontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
              ],
            ),
          ],
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
