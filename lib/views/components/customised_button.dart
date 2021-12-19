import 'package:dictionary/controllers/result_controller.dart';
import 'package:dictionary/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomisedButton extends GetView {
  CustomisedButton({Key? key, this.icon, required this.word}) : super(key: key);

  final ResultX _x = Get.put(ResultX());
  final SearchX _searchX = Get.put(SearchX());

  final IconData? icon;
  final String word;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_searchX.word.value != '') {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          _x.responseFunction(word);
          _searchX.addToDB();
          _searchX.getSearchedWords();
        }
      },
      color: Get.theme.primaryColor,
      child: Icon(
        icon,
        color: Get.theme.iconTheme.color,
      ),
    );
  }
}
