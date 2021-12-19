import 'package:dictionary/views/pages/main_page.dart';
import 'package:dictionary/views/styles/colour_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final String _t = 'theme';

  Future<void> _setTheme() async {
    await Hive.openBox(_t);
    await Hive.openBox('searchedWords');
    await Hive.openBox('savedWords');

    Box box = Hive.box(_t);

    if (box.get(_t) == null) {
      await box.put(_t, ThemeMode.system.index);
      Get.changeThemeMode(ThemeMode.system);
    } else {
      Get.changeThemeMode(ThemeMode.values[box.get(_t)]);
    }
    const style = SystemUiOverlayStyle(
        systemNavigationBarColor: cpDark,
        systemNavigationBarDividerColor: cpDark,
        systemNavigationBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  @override
  void initState() {
    _setTheme().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offNamed(MainPage.id);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cpLightBlue,
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
