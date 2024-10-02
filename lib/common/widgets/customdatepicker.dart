import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:regiform/common/custom_largebutton.dart';

Color borderColor = custompurpleColor;
Color iconColor = customPurpleColor2;
Color hintTextColor = Colors.grey.shade400;
Color textFieldColor = Colors.black;
final DatePickerControllelr _datePickerControllelr =
    Get.put(DatePickerControllelr());

//

final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

class DatePickerControllelr extends GetxController {
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  TextEditingController dateController = TextEditingController();

  DatePickerControllelr() {
    selectedDate.listen((date) {
      if (date != null) {
        dateController.text = _dateFormat.format(date);
      }
    });
  }
}

// Function to open the calendar modal
void _showDatePicker(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: CalendarCarousel(
          height: 500,
          width: 500,
          onDayPressed: (DateTime date, List events) {
            _datePickerControllelr.selectedDate.value = date;

            Navigator.pop(context); // Close the dialog after selecting a date
          },
          selectedDateTime: _datePickerControllelr.selectedDate.value,
          todayButtonColor: customPurpleColor2,
          selectedDayBorderColor: custompurpleColor,
          selectedDayButtonColor: custompurpleColor,
        ),
      );
    },
  );
}

Widget customDataPicter({
  required BuildContext context,
  double theHeight = 55,
  String labelText = 'Date of birth',
  TextInputType keyboardType = TextInputType.datetime,
  IconData leadingIcon = FontAwesomeIcons.calendarDay,
  IconData suffixIcon = Icons.calendar_today,
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
              color: Colors.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                readOnly: true,
                keyboardType: keyboardType,
                controller: _datePickerControllelr.dateController,
                onTap: () {
                  _showDatePicker(context);
                },
                style: TextStyle(
                    fontSize: 13,
                    color: textFieldColor,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: _datePickerControllelr.dateController.text.isEmpty
                      ? labelText
                      : null,
                  //labelText: labelText,
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
