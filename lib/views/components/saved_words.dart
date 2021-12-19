import 'package:animations/animations.dart';
import 'package:dictionary/controllers/result_controller.dart';
import 'package:dictionary/controllers/saved_words_controller.dart';
import 'package:dictionary/views/components/saved_words/closed_component.dart';
import 'package:dictionary/views/components/saved_words/opened_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class SavedWords extends GetView {
  SavedWords({Key? key}) : super(key: key);

  final ResultX _resultX = Get.put(ResultX());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedWordsController>(
      init: SavedWordsController(),
      builder: (_) => ListView.builder(
        itemCount: _.savedWords.length,
        itemBuilder: (context, int i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: OpenContainer(
            closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            openColor: Get.theme.backgroundColor,
            closedColor: Get.theme.primaryColor,
            openBuilder: (BuildContext context, action) {
              _resultX.getFromDB(_.savedWords[i]['word']);
              return const OpenedComponent();
            },
            closedBuilder: (BuildContext context, action) {
              return Stack(
                children: [
                  ClosedComponent(
                    word: _.savedWords[i]['word'],
                    definition: _.savedWords[i]['definition'],
                    phonetic: _.savedWords[i]['phonetic'],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5.0),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        _.deleteSavedWord(i);
                        _.getSavedWords();
                      },
                      icon: LineIcon(
                        LineIcons.trash,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
