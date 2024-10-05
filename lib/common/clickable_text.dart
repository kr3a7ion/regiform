//
import 'package:flutter/material.dart';
import 'package:regiform/common/custom_largebutton.dart';

Widget clickableText({
  required Function() ontapped,
  String theText = 'Reset Password',
  double theSize = 16,
}) {
  return GestureDetector(
      onTap: ontapped,
      child: FittedBox(
        fit: BoxFit.contain,
        child: smallText16(
          theColor: custompurpleColor,
          theFontWeight: FontWeight.bold,
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
