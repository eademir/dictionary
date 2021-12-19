import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ErrorComponent extends GetView {
  const ErrorComponent(this.errorCode, {Key? key}) : super(key: key);

  final int errorCode;

  @override
  Widget build(BuildContext context) {
    if (errorCode == 404) {
      return Center(
        child: Column(
          children: [
            Lottie.asset(
              'images/404.json',
              repeat: true,
              width: 300,
              height: 300,
            ),
            Text(
              'no word'.tr,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
      );
    } else {
      return Center(
          child: Column(
        children: [
          Lottie.asset(
            'images/connection.json',
            repeat: true,
            width: 300,
            height: 300,
          ),
          Text(
            'connection'.tr,
            style: Get.textTheme.bodyText1,
          ),
        ],
      ));
    }
  }
}
