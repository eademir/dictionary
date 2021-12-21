import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SavedWordsController extends GetxController {
  final Box _box = Hive.box('savedWords');

  List<Map> savedWords = [];

  void getSavedWords() {
    savedWords = [];
    for (int i = 0; i < _box.length; i++) {
      savedWords.add({
        'word': _box.getAt(i)['word'],
        'definition': _box.getAt(i)['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]
            ['shortDefinitions'][0],
        'phonetic': _box.getAt(i)['results'][0]['lexicalEntries'][0]['entries'][0]['pronunciations'][0]
            ['phoneticSpelling'],
      });
    }
    update();
  }

  void deleteSavedWord(int i) {
    _box.deleteAt(i);
    getSavedWords();
  }

  @override
  void onInit() {
    getSavedWords();
    super.onInit();
  }
}
