import 'package:dictionary/models/list_of_common_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SearchX extends GetxController {
  final ListOfCommonWords _words = ListOfCommonWords();
  Rx<String> word = ''.obs;
  TextEditingController wordTextController = TextEditingController();
  List<String> filteredWords = [];
  List<String> searchedWords = [];

  final Box _box = Hive.box('searchedWords');

  void deleteWord() {
    word.value = '';
    wordTextController = TextEditingController();
    update();
  }

  void updateWord(String value) {
    word.value = value;
    wordTextController = TextEditingController(text: value);
    searchInWords();
    update();
  }

  void addToDB() {
    if (_box.containsKey(word.value.toLowerCase())) {
      _box.delete(word.value);
    }
    _box.put(word.value.toLowerCase(), word.value.toLowerCase());
    update(searchedWords);
  }

  void searchInWords() {
    if (word.isNotEmpty) {
      filteredWords = _words.words.where((element) => element.startsWith(word.value.toLowerCase())).toList();
      if (filteredWords.length <= 20) {
        //filteredWords.addAll(_words.phrases.where((element) => element.startsWith(word.value.capitalizeFirst!)).toList());
        if (filteredWords.length <= 20) {
          filteredWords.addAll(
              searchedWords.where((element) => element.startsWith(word.value.toLowerCase())).toList());
        }
      }
    } else {
      filteredWords = [];
    }
  }

  void getSearchedWords() {
    searchedWords = [];
    for (int i = 0; i < _box.length; i++) {
      searchedWords.add(_box.getAt(i));
    }
    update();
  }

  @override
  void onInit() {
    getSearchedWords();
    super.onInit();
  }
}
