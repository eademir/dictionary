import 'package:dictionary/controllers/settings_controller.dart';
import 'package:dictionary/views/styles/colour_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _padNumber = 10;
    const double _number = 150;

    return GetBuilder<SettingsX>(
      init: SettingsX(),
      builder: (_) => Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _.setTheme(ThemeMode.light.index);
                Get.changeThemeMode(ThemeMode.light);
              },
              child: AnimatedContainer(
                padding: const EdgeInsets.all(_padNumber),
                margin: const EdgeInsets.all(_padNumber),
                width: _number,
                height: _number,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('images/day.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: _.selected == ThemeMode.light ? cpDarkBlue : cpLight,
                    width: 3.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 2.0,
                      color: cpTransparentDark,
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.maxFinite,
                    color: cpLight,
                    child: Text(
                      'light'.tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        color: cpDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _.setTheme(ThemeMode.dark.index);
                Get.changeThemeMode(ThemeMode.dark);
              },
              child: AnimatedContainer(
                padding: const EdgeInsets.all(_padNumber),
                margin: const EdgeInsets.all(_padNumber),
                width: _number,
                height: _number,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('images/night.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: _.selected == ThemeMode.dark ? cpDarkBlue : cpLight,
                    width: 3.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 2.0,
                      color: cpTransparentDark,
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.maxFinite,
                    color: cpLight,
                    child: Text(
                      'dark'.tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        color: cpDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _.setTheme(ThemeMode.system.index);
                Get.changeThemeMode(ThemeMode.system);
              },
              child: AnimatedContainer(
                padding: const EdgeInsets.all(_padNumber),
                margin: const EdgeInsets.all(_padNumber),
                width: _number,
                height: _number,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('images/day_and_night.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: _.selected == ThemeMode.system ? cpDarkBlue : cpLight,
                    width: 3.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 2.0,
                      color: cpTransparentDark,
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.maxFinite,
                    color: cpLight,
                    child: Text(
                      'systemDefault'.tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        color: cpDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
