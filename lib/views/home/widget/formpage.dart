import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regiform/common/clickable_text.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/common/custom_textfield.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';

Widget regformPage(
  BuildContext context,
  PageController theController, {
  int theIndex = 0,
  String theHeaderText = 'R E G I S T R A T I O N',
}) {
  final Homecontroller homecontroller = Get.put(Homecontroller());
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        smallText16(theHeaderText,
            theSize: 30,
            theColor: const Color.fromARGB(255, 162, 63, 255),
            theFontWeight: FontWeight.bold),
        const SizedBox(height: 20),
        customTextField(
          homecontroller.nameTextController,
          lableText: 'Fullname',
          leadingIcon: Icons.person_2,
        ),
        const SizedBox(
          height: 10,
        ),
        customTextField(
          homecontroller.emailTextController,
          lableText: 'Email',
          leadingIcon: Icons.email,
        ),
        const SizedBox(
          height: 10,
        ),
        customTextField(
          homecontroller.addressTextController,
          lableText: 'Address',
          leadingIcon: Icons.location_city,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 40),
          child: _nextButton(theIndex, context, theController),
        ),
      ],
    ),
  );
}

Widget _nextButton(
  int thePageIndex,
  BuildContext context,
  PageController thePageController,
) {
  return Column(
    children: [
      thePageIndex < 3
          ? const SizedBox(
              height: 0,
            )
          : const SizedBox(
              height: 30,
            ),
      //

      thePageIndex == 3
          ? largeOutlinedButton(
              thewidth: 100,
              theText: 'Save',
              onTapped: () {},
            )
          : const SizedBox.shrink(),
    ],
  );
}
