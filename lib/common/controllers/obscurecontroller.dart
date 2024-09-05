import 'package:get/get.dart';

class ObscureTextController extends GetxController {
  RxBool isActive = false.obs;

  void toogleObscure() {
    isActive.value = !isActive.value;
  }
}
