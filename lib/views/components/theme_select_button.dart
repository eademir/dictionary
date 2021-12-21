import 'package:dictionary/controllers/settings_controller.dart';
import 'package:dictionary/views/styles/colour_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSelectButton extends GetView<SettingsX> {
  const ThemeSelectButton({
    Key? key,
    required ThemeMode theme,
    required String imagePath,
    required String themeName,
  })  : _theme = theme,
        _imagePath = imagePath,
        _themeName = themeName,
        super(key: key);

  final double _padNumber = 10;
  final double _number = 150;
  final ThemeMode _theme;
  final String _imagePath;
  final String _themeName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsX(),
      builder: (SettingsX _) => GestureDetector(
        onTap: () {
          _.setTheme(_theme.index);
          Get.changeThemeMode(_theme);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(_padNumber),
          margin: EdgeInsets.all(_padNumber),
          width: _number,
          height: _number,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_imagePath),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: _.selected == _theme ? cpDarkBlue : cpLight,
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
                _themeName.tr,
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
    );
  }
}
