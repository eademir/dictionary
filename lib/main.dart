import 'package:dictionary/controllers/languages.dart';
import 'package:dictionary/views/pages/main_page.dart';
import 'package:dictionary/views/pages/welcome_page.dart';
import 'package:dictionary/views/styles/custom_theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await Hive.initFlutter();
  runApp(const App());
  await dotenv.load(fileName: '.env');
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customThemeDataLight,
      darkTheme: customThemeDataDark,
      themeMode: ThemeMode.system,
      title: 'Dictionary',
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'GB'),
      home: const WelcomePage(),
      getPages: [
        GetPage(name: MainPage.id, page: () => MainPage()),
      ],
    );
  }
}
