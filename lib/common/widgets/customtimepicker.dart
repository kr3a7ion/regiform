import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:regiform/common/custom_largebutton.dart';

// Define your custom colors
Color borderColor = custompurpleColor;
Color iconColor = customPurpleColor2;
Color hintTextColor = Colors.grey.shade400;
Color textFieldColor = Colors.black;

final TimePickerController _timePickerController =
    Get.put(TimePickerController());

final DateFormat _timeFormat = DateFormat('HH:mm'); // 24-hour format

class TimePickerController extends GetxController {
  Rx<TimeOfDay?> selectedTime = Rxn<TimeOfDay>(); // Nullable TimeOfDay
  TextEditingController timeController = TextEditingController();

  TimePickerController() {
    selectedTime.listen((time) {
      if (time != null) {
        // Format the selected time and update the text controller
        final now = DateTime.now();
        final selectedDateTime =
            DateTime(now.year, now.month, now.day, time.hour, time.minute);
        timeController.text = _timeFormat.format(selectedDateTime);
      }
    });
  }
}

// Function to open the time picker dialog
void _showTimePicker(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: _timePickerController.selectedTime.value ?? TimeOfDay.now(),
  );

  if (picked != null) {
    _timePickerController.selectedTime.value = picked;
  }
}

Widget customTimePicker({
  required BuildContext context,
  double theHeight = 55,
  String labelText = 'Select time', // Use for the hint
  TextInputType keyboardType = TextInputType.datetime,
  IconData leadingIcon = FontAwesomeIcons.clock,
  IconData suffixIcon = Icons.timer,
  bool usePrefix = true,
  bool useSuffix = false,
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
                controller: _timePickerController.timeController,
                onTap: () {
                  _showTimePicker(context);
                },
                style: TextStyle(
                  fontSize: 13,
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
                  hintText: _timePickerController.timeController.text.isEmpty
                      ? labelText
                      : null, // Show hintText if no time is selected
                  hintStyle: TextStyle(color: hintTextColor, fontSize: 13),
                  prefixIcon: usePrefix
                      ? Icon(
                          leadingIcon,
                          color: iconColor,
                          size: 16,
                        )
                      : null,
                  suffixIcon: useSuffix
                      ? Icon(
                          suffixIcon,
                          color: iconColor,
                          size: 16,
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
