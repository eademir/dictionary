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
    box.put(_details.getWord(), _details.value);
    update();
  }

  void deleteSavedWordFromDB(int i) {
    box.deleteAt(i);
    update();
  }

  void getFromDB(int inputWord) async {
    Map<String, dynamic> value = Map<String, dynamic>.from(box.getAt(inputWord));
    _setValues(value);
    update();
  }

  void _setValues(value) {
    _details.setValue(value);

    definitions = _details.definitions;
    synonyms = _details.synonyms;
    phonetic = _details.phonetic;
    examples = _details.examples;
    audioUK = _details.audioUK;
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
        _setValues(value);
      },
    ).whenComplete(() {
      isOk.value = true;
      loading.value = false;
      update();
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      error = HttpStatus(0); //temporary
    }).catchError((e) {
      isError.value = true;
      loading.value = false;
      error = e;
      return;
    });
  }
}
