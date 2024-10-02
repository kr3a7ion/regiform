import 'package:flutter/services.dart';

void hideSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}
