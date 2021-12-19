import 'package:dictionary/controllers/result_controller.dart';
import 'package:dictionary/controllers/search_controller.dart';
import 'package:dictionary/views/components/customised_button.dart';
import 'package:dictionary/views/components/error_component.dart';
import 'package:dictionary/views/components/filter.dart';
import 'package:dictionary/views/components/result.dart';
import 'package:dictionary/views/components/searched_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends GetView {
  const SearchPage({Key? key}) : super(key: key);
  static String id = '/search_page';

  @override
  Widget build(BuildContext context) {
    final SearchX _x = Get.put(SearchX());
    final ResultX _result = Get.put(ResultX());
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      child: Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      TextField(
                        controller: _x.wordTextController,
                        decoration: InputDecoration(
                          label: Text('type word'.tr),
                        ),
                        onChanged: (val) {
                          if (_x.word.value != val) {
                            _result.isOk.value = false;
                            _result.isError.value = false;
                          }
                          _x.word.value = val;
                          _x.searchInWords();
                        },
                      ),
                      _x.word.value != ''
                          ? Container(
                              height: 53,
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () {
                                  _x.deleteWord();
                                  _result.isOk.value = false;
                                },
                                icon: const Icon(
                                  Icons.close,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                CustomisedButton(
                  icon: LineIcons.search,
                  word: _x.word.value,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            _x.word.value != ''
                ? _result.loading.isFalse
                    ? _result.isOk.isTrue
                        ? _result.isError.isTrue
                            ? ErrorComponent(_result.error?.code ?? 0)
                            : Expanded(
                                child: Results(),
                              )
                        : Filter()
                    : Center(
                        child: Lottie.asset(
                          'images/loading.json',
                          repeat: true,
                          width: 300,
                          height: 300,
                        ),
                      )
                : const SearchedWords(),
          ],
        ),
      ),
    );
  }
}
