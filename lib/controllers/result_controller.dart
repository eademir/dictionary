import 'dart:async';

import 'package:dictionary/models/word_details.dart';
import 'package:dictionary/services/dictionary_api.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:hive/hive.dart';

class ResultX extends GetxController {
  final WordDetails _details = WordDetails();

  final Box box = Hive.box('savedWords');

  String? audioUK;
  String? audioUS;

  List? definitions;
  List? synonyms;
  List? antonyms;
  List? examples;
  String? phonetic;
  String? word;
  Rx<bool> isError = false.obs;
  Rx<bool> isOk = false.obs;
  Rx<bool> loading = false.obs;
  HttpStatus? error;

  void addToDB() {
    if (box.containsKey(_details.getWord())) {
      box.delete(_details.getWord());
      update();
      return;
    }
    box.put(_details.getWord(), {
      'word': _details.getWord(),
      'definitions': definitions,
      'synonyms': synonyms,
      'phonetic': phonetic,
      'examples': examples,
      'audioUK': audioUK,
    });
    update();
  }

  void deleteSavedWordFromDB(int i) {
    box.deleteAt(i);
    update();
  }

  void getFromDB(String inputWord) async {
    dynamic getter = await box.get(inputWord);
    word = getter['word'];
    definitions = getter['definitions'];
    synonyms = getter['synonyms'];
    phonetic = getter['phonetic'];
    examples = getter['examples'];
    audioUK = getter['audioUK'];
    update();
  }

  Future<void> responseFunction(String val) async {
    word = val;
    loading.value = true;
    _details.setWord(val);
    await DictionaryApi()
        .getWord(
          endpoint: 'entries',
          languageCode: 'en-gb',
          wordID: _details.uri(),
        )
        .then(
          (value) {
            _details.setValue(value);

            definitions = _details.definitions;
            synonyms = _details.synonyms;
            phonetic = _details.phonetic;
            examples = _details.examples;
            audioUK = _details.audioUK;
          },
        )
        .whenComplete(() {
          isOk.value = true;
          loading.value = false;
          update();
        })
        .timeout(const Duration(seconds: 5), onTimeout: () {})
        .catchError((e) {
          isError.value = true;
          loading.value = false;
          error = e;
          return;
        });
  }
}
