import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClosedComponent extends GetView {
  const ClosedComponent({Key? key, this.definition, this.phonetic, this.word}) : super(key: key);

  final String? word;
  final String? definition;
  final String? phonetic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$word',
                style: Get.textTheme.headline5,
              ),
              const SizedBox(width: 8.0),
              phonetic == null
                  ? Container()
                  : Text(
                      'phonetic: $phonetic',
                      style: Get.textTheme.bodyText1,
                    ),
            ],
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: definition != null
                      ? Text(
                          'definition: $definition',
                          style: Get.textTheme.bodyText1,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
