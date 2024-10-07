import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



Widget signWidget({required Uint8List data}) {
  return Container(
    height: 350,
    width: 400,
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Image.memory(data),
    ),
  );
}
