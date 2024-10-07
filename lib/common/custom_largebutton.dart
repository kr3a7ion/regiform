import 'package:flutter/material.dart';

Color custompurpleColor = const Color(0xff220749);
Color customPurpleColor2 = const Color(0xff4D1285);
Widget largeButton({
  required String theText,
  required Function() onTapped,
  double thebuttonHeight = 70,
  double thewidth = double.infinity,
  double theTextSize = 18,
  double thebuttonRadius = 10,
  Color theTextColor = Colors.white,
}) {
  return SizedBox(
    height: thebuttonHeight,
    width: thewidth,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(custompurpleColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(thebuttonRadius),
            ))),
        onPressed: onTapped,
        child: FittedBox(
          child: Text(
            theText,
            style: TextStyle(
              color: theTextColor,
              fontSize: theTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
  );
}

Widget largeOutlinedButton({
  required String theText,
  required Function() onTapped,
  double thebuttonHeight = 70,
  double thewidth = double.infinity,
  double theTextSize = 18,
  double thebuttonRadius = 10,
  Color theTextColor = const Color(0xff4D1285),
}) {
  return SizedBox(
    height: thebuttonHeight,
    width: thewidth,
    child: OutlinedButton(
        style: ButtonStyle(
            side: WidgetStatePropertyAll(BorderSide(
              color: custompurpleColor,
              width: 2,
            )),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(thebuttonRadius),
            ))),
        onPressed: onTapped,
        child: Text(
          theText,
          style: TextStyle(
            color: theTextColor,
            fontSize: theTextSize,
            fontWeight: FontWeight.bold,
          ),
        )),
  );
}
