import 'package:flutter/material.dart';

Widget largeButton({
  required String theText,
  required Function() onTapped,
  double thebuttonHeight = 50,
  double theTextSize = 16,
  double thebuttonRadius = 10,
  Color theTextColor = Colors.white,
}) {
  return SizedBox(
    height: thebuttonHeight,
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.grey),
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

Widget largeOutlinedButton({
  required String theText,
  required Function() onTapped,
  double thebuttonHeight = 50,
  double theTextSize = 16,
  double thebuttonRadius = 10,
  Color theTextColor = Colors.grey,
}) {
  return SizedBox(
    height: thebuttonHeight,
    width: double.infinity,
    child: OutlinedButton(
        style: ButtonStyle(
            side: WidgetStatePropertyAll(BorderSide(
              color: Colors.grey.shade400,
              width: 1.5,
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
