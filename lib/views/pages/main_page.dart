import 'package:dictionary/controllers/main_page_controller.dart';
import 'package:dictionary/views/components/saved_words.dart';
import 'package:dictionary/views/pages/search_page.dart';
import 'package:dictionary/views/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class MainPage extends GetView {
  MainPage({Key? key}) : super(key: key);

  final MainX _x = Get.put(MainX());

  static String id = '/main_page';

  final List<Widget> _pages = [
    const SearchPage(),
    SavedWords(),
    const SettingPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      label: 'search'.tr,
      icon: const Icon(
        LineIcons.search,
      ),
    ),
    BottomNavigationBarItem(
      label: 'noted'.tr,
      icon: const Icon(
        LineIcons.stickyNote,
      ),
    ),
    BottomNavigationBarItem(
      label: 'settings'.tr,
      icon: const Icon(
        Icons.settings,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _x.controller,
          onPageChanged: _x.updateIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: GetBuilder<MainX>(
        builder: (_) => BottomNavigationBar(
          backgroundColor: Get.theme.backgroundColor,
          currentIndex: _x.activeIndex,
          onTap: _x.onItemTapped,
          selectedItemColor: Get.theme.iconTheme.color,
          unselectedItemColor: Get.theme.primaryColor,
          items: _bottomNavigationBarItems,
          selectedLabelStyle: Get.textTheme.bodyText1,
          unselectedLabelStyle: Get.textTheme.bodyText1,
        ),
      ),
    );
  }
}
