import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_GB': {
          'no word': 'There is no such a word',
          'type word': 'Type Word',
          'noted': 'Favorites',
          'settings': 'Settings',
          'search': 'Search',
          'light': 'Light',
          'dark': 'Dark',
          'systemDefault': 'System Default',
          'connection': 'No Connection',
        }
      };
}
