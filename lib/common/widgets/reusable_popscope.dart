import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customPopScope(
  Function()?  addFunctions,
  {
  required DateTime? lastPressed,
  required BuildContext context,
  required Widget child,
}
) {
  return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final now = DateTime.now();
        if (didPop) {
          return;
        } else if (lastPressed == null ||
            now.difference(lastPressed!) > Duration(seconds: 2)) {
          // Save the current time when the back button is pressed
          lastPressed = now;
          //Show a snackbar to inform the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press back again to exit app'),
              duration:
                  Duration(seconds: 2), // Time window for pressing back again
            ),
          );
        } else {
          // Exit the app if the back button is pressed twice within 2 seconds
          addFunctions;
          SystemNavigator.pop();
        }
      },
      child: child);
}
