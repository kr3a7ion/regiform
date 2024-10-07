import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';

// Define your custom colors
Color borderColor = custompurpleColor;
Color iconColor = customPurpleColor2;
Color hintTextColor = Colors.grey.shade400;
Color textFieldColor = Colors.black;


final Homecontroller _homecontroller = Get.put(Homecontroller());

final DateFormat _timeFormat = DateFormat('HH:mm'); // 24-hour format

class TimePickerController extends GetxController {
  Rx<TimeOfDay?> arrivalSelectedTime = Rxn<TimeOfDay>();
  Rx<TimeOfDay?> departureSelectedTime = Rxn<TimeOfDay>(); // Nullable TimeOfDay


  TimePickerController() {
    arrivalSelectedTime.listen((time) {
      if (time != null) {
        // Format the selected time and update the text controller
        final now = DateTime.now();
        final selectedDateTime =
            DateTime(now.year, now.month, now.day, time.hour, time.minute);
        _homecontroller.arrivalTimeController.text = _timeFormat.format(selectedDateTime);
      }
    });

    departureSelectedTime.listen((time) {
      if (time != null) {
        // Format the selected time and update the text controller
        final now = DateTime.now();
        final selectedDateTime =
            DateTime(now.year, now.month, now.day, time.hour, time.minute);
        _homecontroller.departureTimeController.text =
            _timeFormat.format(selectedDateTime);
      }
    });
  }
}

// Function to open the time picker dialog
void showMyTimePicker(BuildContext context, {required Rx<TimeOfDay?> timeData} ) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: timeData.value ?? TimeOfDay.now(),
  );

  if (picked != null) {
    timeData.value = picked;
  }
}

Widget customTimePicker({
  required BuildContext context,
  double theHeight = 70,
  String labelText = 'Select time', // Use for the hint
  TextInputType keyboardType = TextInputType.datetime,
  IconData leadingIcon = FontAwesomeIcons.clock,
  IconData suffixIcon = Icons.timer,
  bool usePrefix = true,
  bool useSuffix = false,
  required TextEditingController theController,
  required Function() onpressed,
}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: theHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: borderColor),
            color: Colors.white,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                readOnly: true,
                keyboardType: keyboardType,
                controller: theController,
                onTap: onpressed,
                style: TextStyle(
                  fontSize: 16,
                  color: textFieldColor,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical:
                        15, // Adjust vertical padding for better alignment
                    horizontal: 10,
                  ),
                  hintText: theController.text.isEmpty
                      ? labelText
                      : null, // Show hintText if no time is selected
                  hintStyle: TextStyle(
                    color: hintTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: usePrefix
                      ? Icon(
                          leadingIcon,
                          color: iconColor,
                          size: 20,
                        )
                      : null,
                  suffixIcon: useSuffix
                      ? Icon(
                          suffixIcon,
                          color: iconColor,
                          size: 20,
                        )
                      : null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
