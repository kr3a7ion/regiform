//
import 'package:flutter/material.dart';

Widget clickableText({
  required Function() ontapped,
  String theText = 'Reset Password',
  double theSize = 13,
}) {
  return GestureDetector(
      onTap: ontapped,
      child: FittedBox(
        fit: BoxFit.contain,
        child: smallText16(
          theText,
          theSize: theSize,
        ),
      ));
}

Widget smallText16(
  String theText, {
  double theSize = 16,
  Color theColor = Colors.white,
  FontWeight theFontWeight = FontWeight.normal,
}) {
  return Text(
    theText,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: theSize, color: theColor, fontWeight: theFontWeight),
  );
}
