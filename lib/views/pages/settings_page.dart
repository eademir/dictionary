import 'package:dictionary/views/components/theme_select_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: const [
          ThemeSelectButton(
            theme: ThemeMode.light,
            imagePath: 'images/day.jpeg',
            themeName: 'light',
          ),
          ThemeSelectButton(
            theme: ThemeMode.dark,
            imagePath: 'images/night.jpeg',
            themeName: 'dark',
          ),
          ThemeSelectButton(
            theme: ThemeMode.system,
            imagePath: 'images/day_and_night.jpeg',
            themeName: 'systemDefault',
          ),
        ],
      ),
    );
  }
}
