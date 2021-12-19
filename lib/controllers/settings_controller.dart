import 'package:dictionary/controllers/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsX extends GetxController {
  MainX _x = Get.find();

  final _box = Hive.box('theme');
  ThemeMode? selected;

  Future<void> setTheme(int theme) async {
    selected = ThemeMode.values[theme];
    await _box.put('theme', theme);
    Future.delayed(const Duration(milliseconds: 185), () {
      _x.update();
    });
    update();
  }

  @override
  void onInit() async {
    if (await _box.get('theme') != null) {
      setTheme(await _box.get('theme'));
    } else {
      setTheme(ThemeMode.system.index);
    }
    super.onInit();
  }
}
