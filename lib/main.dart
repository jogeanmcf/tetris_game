import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:tetris_game/controllers/theme_controler.dart';
import 'package:tetris_game/screens/home_page.dart';

import 'global.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());

  doWhenWindowReady(() {
    final initialSize = Size(500, 500);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
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
              home: HomePage()); // TODO: mudar o nome disso
        });
  }
}
