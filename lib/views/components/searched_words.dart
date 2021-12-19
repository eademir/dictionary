// views.components
// Eray
// 04:36 - 14.12.2021

import 'package:dictionary/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';

class SearchedWords extends GetView {
  const SearchedWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('searchedWords');
    return Expanded(
      child: GetBuilder<SearchX>(
        init: SearchX(),
        builder: (_) => ListView.builder(
          itemCount: _.searchedWords.length,
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                _.updateWord(_.searchedWords[i]);
              },
              title: Text(
                _.searchedWords[i],
                style: Get.textTheme.bodyText1,
              ),
              trailing: IconButton(
                onPressed: () {
                  box.deleteAt(i);
                  _.getSearchedWords();
                },
                icon: const Icon(LineIcons.trash),
              ),
            );
          },
        ),
      ),
    );
  }
}
