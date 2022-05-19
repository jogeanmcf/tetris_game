import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:tetris/controllers/theme_controler.dart';
import 'package:tetris/screens/home_page.dart';

import 'dart:io';

import 'package:window_size/window_size.dart';

import 'global.dart';

//TODO: try to fix windows size issue
// talvez tenhamos que salvar na pasta $HOME/.config como diz no post
// https://forum.snapcraft.io/t/place-for-settings-files/19517
// mas ainda não sei como fazer isso atravez do getStorage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Tetris');
    setWindowMaxSize(const Size(500, 550));
    setWindowMinSize(const Size(500, 550));
  }

  runApp(MyApp());
}

//TODO: there is a bug when pressing the arrow down key
//TODO: chante to a light color the text of the buttons of the wellcome screen
//TODO: change names of classes
//TODO: documentation of the code
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (_) {
          return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              theme: themeController.theme,
              // theme: themeController.newTheme,
              home: const HomePage()); // TODO: mudar o nome disso
        });
  }
}
