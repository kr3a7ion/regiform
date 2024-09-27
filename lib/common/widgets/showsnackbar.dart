// Show a snackbar with an error message
import 'package:get/get.dart';

void showSnackbar(String errorTitle, String message) {
  Get.snackbar(errorTitle, message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5));
}



