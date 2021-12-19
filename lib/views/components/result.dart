import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/controllers/result_controller.dart';
import 'package:dictionary/controllers/saved_words_controller.dart';
import 'package:dictionary/views/styles/colour_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Results extends GetView<ResultX> {
  Results({Key? key, this.showFavoriteButton = true}) : super(key: key);

  final AudioPlayer audioPlayer = AudioPlayer();
  final bool? showFavoriteButton;

  final SavedWordsController _x = Get.put(SavedWordsController());

  @override
  Widget build(BuildContext context) {
    const double _sizedHeight = 20.0;
    play(String url) async {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        // success
      }
    }

    return SingleChildScrollView(
      child: GetBuilder<ResultX>(
        init: ResultX(),
        builder: (_) => Stack(
          children: [
            !showFavoriteButton!
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(top: 1.0, right: 10.0),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        LineIcons.heartAlt,
                        color: _.box.containsKey(_.word) ? cpRed : cpLight,
                      ),
                      onPressed: () {
                        _.addToDB();
                        _x.getSavedWords();
                      },
                    ),
                  ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _.audioUK != null
                        ? IconButton(
                            icon: const Icon(LineIcons.volumeUp),
                            onPressed: () {
                              play(_.audioUK!);
                            },
                          )
                        : Container(),
                    _.phonetic != null
                        ? Text(
                            '${_.phonetic}',
                            style: Get.textTheme.bodyText1,
                          )
                        : Container(),
                  ],
                ),
                _.definitions != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: _sizedHeight),
                          Text(
                            'Definitions:',
                            style: Get.textTheme.headline5,
                          ),
                          const Divider(
                            height: 10,
                            endIndent: 20.0,
                            thickness: 1.2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              _.definitions!.length,
                              (index) => Text(
                                '- ${_.definitions![index]}',
                                textAlign: TextAlign.left,
                                style: Get.textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                _.examples != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: _sizedHeight),
                          Text(
                            'Examples:',
                            style: Get.textTheme.headline5,
                          ),
                          const Divider(
                            height: 10,
                            endIndent: 20.0,
                            thickness: 1.2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              _.examples!.length,
                              (index) => Text(
                                '- ${_.examples![index]['text']}',
                                textAlign: TextAlign.left,
                                style: Get.textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                _.synonyms != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: _sizedHeight),
                          Text(
                            'Synonyms:',
                            style: Get.textTheme.headline5,
                          ),
                          const Divider(
                            height: 10,
                            endIndent: 20.0,
                            thickness: 1.2,
                          ),
                          Wrap(
                            children: List.generate(
                              _.synonyms!.length,
                              (i) {
                                return Container(
                                  color: const Color(0xCCCCCCCC),
                                  margin: const EdgeInsets.all(3.0),
                                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                                  child: Text(
                                    '${_.synonyms![i]['text']}',
                                    style: Get.textTheme.bodyText1,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
