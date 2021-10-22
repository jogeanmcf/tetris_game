import 'package:flutter/material.dart';
import 'package:tetris_game/screens/game_over_screen.dart';
import 'package:tetris_game/screens/start_the_game.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void showGameOver() {
  showDialog(
      barrierDismissible: false, // what this is about?
      context: navigatorKey.currentContext!,
      builder: (context) => Center(
            child: Material(
              color: Colors.transparent,
              child: GameOverScreen(),
            ),
          ));
}

void startTheGame() {
  showDialog(
      barrierDismissible: false, // what this is about?
      context: navigatorKey.currentContext!,
      builder: (context) => Center(
            child: Material(
              color: Colors.transparent,
              child: StartGame(),
            ),
          ));
}
