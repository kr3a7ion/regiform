import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mypagecontroller extends GetxController{
  final PageController pageController = PageController();

  RxInt theIndex = 0.obs;

  void changeIndex(int index) {
    theIndex.value = index;
  }
}