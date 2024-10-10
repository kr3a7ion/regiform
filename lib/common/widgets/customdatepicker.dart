import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:regiform/common/custom_largebutton.dart';
import 'package:regiform/views/home/controllers/homecontroller.dart';

Color borderColor = custompurpleColor;
Color iconColor = customPurpleColor2;
Color hintTextColor = Colors.grey.shade400;
Color textFieldColor = Colors.black;

final Homecontroller _homecontroller = Get.put(Homecontroller());
//

final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

class DatePickerControlleler extends GetxController {
  Rxn<DateTime> selectedDOBDate = Rxn<DateTime>();
  Rxn<DateTime> selectedArrivalDate = Rxn<DateTime>();
  Rxn<DateTime> selectedDepartureDate = Rxn<DateTime>();
  TextEditingController dateController = TextEditingController();

  DatePickerControlleler() {
    selectedDOBDate.listen((date) {
      if (date != null) {
        _homecontroller.dateOfBirthController.text = _dateFormat.format(date);

      }
    });

    selectedArrivalDate.listen((data) {
      if (data != null) {
        _homecontroller.arrivalDateController.text = _dateFormat.format(data);
      }
    });

    selectedDepartureDate.listen((data) {
      if (data != null) {
        _homecontroller.departureDateController.text = _dateFormat.format(data);
      }
    });
  }
}

// Function to open the calendar modal
void showMyDatePicker(
  BuildContext context,
  Rxn<DateTime> dateData,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: CalendarCarousel(
          height: 500,
          width: 500,
          onDayPressed: (DateTime date, List events) {
            dateData.value = date;
            Navigator.pop(context); // Close the dialog after selecting a date
          },
          selectedDateTime: dateData.value,
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
  double theHeight = 70,
  String labelText = 'Date of birth',
  TextInputType keyboardType = TextInputType.datetime,
  IconData leadingIcon = FontAwesomeIcons.calendarDay,
  IconData suffixIcon = Icons.calendar_today,
  bool usePrefix = true,
  bool useSuffix = false,
  required Function() onpressed,
  required TextEditingController theController,
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
                controller: theController,
                onTap: onpressed,
                style: TextStyle(
                    fontSize: 16,
                    color: textFieldColor,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: theController.text.isEmpty ? labelText : null,
                  hintStyle: TextStyle(
                      color: hintTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
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
