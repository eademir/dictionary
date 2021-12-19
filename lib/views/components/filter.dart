// views.components
// Eray
// 04:33 - 14.12.2021

import 'package:dictionary/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends GetView {
  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<SearchX>(
      init: SearchX(),
      builder: (_) => ListView.builder(
        itemCount: _.filteredWords.length < 20 ? _.filteredWords.length : 20,
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () {
              _.updateWord(_.filteredWords[i]);
            },
            title: Text(
              _.filteredWords[i],
              style: Get.textTheme.bodyText1,
            ),
          );
        },
      ),
    ));
  }
}
