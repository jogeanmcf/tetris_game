import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tetris_game/global.dart';
import 'package:tetris_game/models/grid.dart';
import 'package:tetris_game/models/tetris.dart';

class GameController extends GetxController {
  final gameData = GetStorage();
  int _maxSxore = 0;
  bool isPlaying = true;
  Grid grid = Grid(width: 10, height: 13);
  Grid sideGrid = Grid(width: 5, height: 5);
  Tetris tetris = Tetris(gridWidth: 10);

  int get getMaxScore => gameData.read('maxScore') ?? _maxSxore;

  late Timer timer;

  void setTime() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (grid.checkGameOver()) {
        timer.cancel();
        isPlaying = false;
        update();
        showGameOver();
      }
      if (hitDownSide()) {
        grid.checkFullBlueLine();
        if (grid.numberOfFullLines >= getMaxScore) {
          _maxSxore = grid.numberOfFullLines;
          gameData.write('maxScore', _maxSxore);
        }
        await Future.delayed(Duration(microseconds: 300));
        tetris.newPice();
      }
      tetris.y++;
      update();
    });
  }

  void pausePlay() {
    isPlaying = !isPlaying;
    update();
  }

  void start() {
    setTime();
  }

  void saveNewRecord() {}

  void reset() {
    grid.clear();
    tetris.newPice();
    isPlaying = true;
    setTime();
    update();
  }

  void rotate() {
    if (isPlaying && canRotate()) {
      tetris.rotate();
      update();
    }
  }

  void moveLeft() {
    if (isPlaying && canMoveLeft()) {
      tetris.moveLeft();
      update();
    }
  }

  void moveRight() {
    if (isPlaying && canMoveRight()) {
      tetris.moveRight();
      update();
    }
  }

  void moveDown() {
    if (hitDownSide()) {
      return;
    } else {
      tetris.moveDown();
      update();
    }
  }

  // Game rulers
  bool hitDownSide() {
    bool hasHited = false;

    hasHited = tetris.pice.any((element) => grid.me[element + grid.width] == 1);

    if (hasHited) {
      tetris.pice.forEach((element) {
        grid.me[element] = 1;
      });
      return hasHited;
    }

    return hasHited;
  }

  bool canMoveLeft() {
    bool _canMoveLeft = true;
    _canMoveLeft = !tetris.pice.any((element) => grid.me[element - 1] == 1);
    return _canMoveLeft;
  }

  bool canMoveRight() {
    bool _canMoveRight = true;
    _canMoveRight = !tetris.pice.any((element) => grid.me[element + 1] == 1);
    return _canMoveRight;
  }

  bool canRotate() {
    bool _canRotate = true;
    List<int> piceIndex = tetris.piceIndex;
    _canRotate = !tetris.allPices[(piceIndex[0] + 1) % 4][piceIndex[1]]
        .any((index) => grid.me[index] == 1);
    return _canRotate;
  }
}
