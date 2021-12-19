import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainX extends GetxController {
  int activeIndex = 0;
  late PageController controller;

  @override
  void onInit() {
    controller = PageController(initialPage: activeIndex);
    super.onInit();
  }

  void onItemTapped(int index) {
    activeIndex = index;
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    update();
  }

  void updateIndex(int index) {
    activeIndex = index;
    update();
  }
}
