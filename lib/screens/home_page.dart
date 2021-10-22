import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:tetris_game/controllers/game_controler.dart';
import 'package:tetris_game/screens/start_the_game.dart';
import 'package:tetris_game/widgets/grid_widget.dart';
import 'package:tetris_game/widgets/keyboard_handler.dart';
import 'package:tetris_game/widgets/side_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GameController gameController = Get.put(GameController());

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new StartGame();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(
                    child: MoveWindow(
                  child: Center(
                      child: Text(
                    'Tetris Game',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                )),
                MinimizeWindowButton(),
                CloseWindowButton()
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: TetrisGame(
                    // TODO: mudar o nome desse widget
                    GetBuilder<GameController>(
                        init: GameController(),
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: GridWidget(
                              gridHeight: 13,
                              gridWidth: 10,
                              grid: gameController.grid,
                              tetrisPice: gameController.tetris.pice,
                            ),
                          );
                        }),
                    onMoveLeft: () {
                      gameController.moveLeft();
                    },
                    onMoveRight: () {
                      gameController.moveRight();
                    },
                    rotate: () {
                      gameController.rotate();
                    },
                    moveDown: () {
                      gameController.moveDown();
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(right: 16),
                        child: GamePainel()))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
