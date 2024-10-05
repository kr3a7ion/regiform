import 'package:flutter/material.dart';

final String logoPath = 'assets/logo/logo.png';
final String heroTaglogo = 'appLogo';

Widget appLogo({
  double logoHeight = 100,
  double logoWidth = 100,
}) {
  return Hero(
    tag: heroTaglogo,
    child: Image.asset(
      logoPath,
      height: logoHeight,
      width: logoWidth,
    ),
  );
}
