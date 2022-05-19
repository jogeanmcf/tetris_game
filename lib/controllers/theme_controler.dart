import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tetris/theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  //TODO: mudar o local de salvamento
  final gameData = GetStorage(r'${SNAP}'); //
  bool _isDarkMode = false;

  // ThemeController() {
  //   _loadPrefs();
  // }

  bool get isDarkModeOn => gameData.read('darkMode') ?? _isDarkMode; //

  ThemeData get theme => isDarkModeOn ? MyThemeData.dark : MyThemeData.light; //
  // ThemeData get theme => MyThemeData.dark; // this is for testing

  void changeTheme(bool isDark) {
    _isDarkMode = isDark;
    gameData.write('darkMode', isDark); //
    update();
  }

  // as shared preferences
  // SharedPreferences? _preferences;

  // bool _darkMode = false;
  // bool get darkMode {
  //   // _darkMode = _preferences!.getBool('darkMode') ?? false;
  //   return _darkMode;
  // }

  // ThemeData get newTheme => darkMode ? MyThemeData.dark : MyThemeData.light;

  // _initPrefs() async {
  //   _preferences ??= await SharedPreferences.getInstance();
  // }

  // _loadPrefs() async {
  //   await _initPrefs();
  //   _darkMode = _preferences!.getBool('darkMode') ?? false;
  // }

  // _savePrefs() async {
  //   await _initPrefs();
  //   _preferences!.setBool('darkMode', _darkMode);
  // }

  // void toogleChangeTheme(bool thing) {
  //   _darkMode = thing;
  //   _savePrefs();
  //   update();
  // }
}
