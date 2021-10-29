import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tetris/theme.dart';

class ThemeController extends GetxController {
  final gameData = GetStorage();
  bool _isDarkMode = false;

  bool get isDarkModeOn => gameData.read('darkMode') ?? _isDarkMode;

  ThemeData get theme => isDarkModeOn ? MyThemeData.dark : MyThemeData.light;

  void changeTheme(bool isDark) {
    _isDarkMode = isDark;
    gameData.write('darkMode', isDark);
    update();
  }

  newRecord(int newRecord) {
    gameData.write('max_score', newRecord);
  }
}
