import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_game/models/tetris.dart';
import 'package:tetris_game/controllers/theme_controler.dart';
import 'package:tetris_game/controllers/game_controler.dart';
import 'package:tetris_game/widgets/grid_widget.dart';

class GamePainel extends StatefulWidget {
  const GamePainel({Key? key}) : super(key: key);

  @override
  _GamePainelState createState() => _GamePainelState();
}

class _GamePainelState extends State<GamePainel> with TickerProviderStateMixin {
  late AnimationController _controller;
  // final int width = 10;
  // final int height = 4;
  bool _isDarkModeOn = false;
  Tetris tetrisPice = Tetris(gridWidth: 5);
  GameController gameController = Get.find();
  ThemeController themeController = Get.find();
  @override
  void initState() {
    tetrisPice.y = 3;
    tetrisPice.x = 1;
    _isDarkModeOn = themeController.isDarkModeOn;
    _controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
        init: GameController(),
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoBox(
                child: Text(gameController.getMaxScore.toString()),
                text: 'Max Score',
                themeController: themeController,
              ),
              InfoBox(
                child: Text(gameController.grid.numberOfFullLines.toString()),
                text: 'Lines',
                themeController: themeController,
              ),
              NextPiceWidget(
                gameController: gameController,
                themeController: themeController,
                nextTetrisPice:
                    tetrisPice.allPices[gameController.tetris.nextPiceIndex[0]]
                        [gameController.tetris.nextPiceIndex[1]],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //TODO: centralizar o icone e fazer a cor do fill ficar do damanho do hover

                  IconButton(
                      tooltip: gameController.isPlaying ? 'pause' : 'play',
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                      icon: AnimatedIcon(
                          color: Theme.of(context).buttonColor,
                          size: 32,
                          icon: AnimatedIcons.pause_play,
                          progress: _controller),
                      onPressed: () {
                        gameController.isPlaying
                            ? _controller.forward()
                            : _controller.reverse();

                        if (gameController.isPlaying) {
                          gameController.pausePlay();
                          gameController.timer.cancel();
                        } else {
                          gameController.pausePlay();
                          gameController.setTime();
                        }
                      }),

                  Column(
                    children: [
                      Text('Dark Mode', style: TextStyle(fontSize: 9)),
                      Tooltip(
                        message: themeController.isDarkModeOn
                            ? 'Disabel Dark Mode'
                            : 'Enable Dark Mode',
                        child: Switch(
                          value: _isDarkModeOn,
                          onChanged: (value) {
                            _isDarkModeOn = !_isDarkModeOn;
                            themeController.changeTheme(_isDarkModeOn);
                            themeController.update();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}

class NextPiceWidget extends StatelessWidget {
  final List<int>? nextTetrisPice;
  final GameController? gameController;
  final ThemeController? themeController;
  NextPiceWidget(
      {Key? key,
      this.nextTetrisPice,
      required this.gameController,
      required this.themeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoBox(
      text: 'Next',
      themeController: themeController,
      // width: double.infinity,
      // margin: EdgeInsets.only(right: 8),
      // padding: EdgeInsets.all(8),
      child: SizedBox(
        height: 80,
        width: 80,
        child: GridWidget(
          grid: gameController!.sideGrid,
          tetrisPice: nextTetrisPice,
          gridHeight: 5,
          gridWidth: 5,
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String? text;
  final Widget? child;
  final ThemeController? themeController;
  const InfoBox(
      {Key? key, this.text, this.child, required this.themeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${this.text}'),
          SizedBox(height: 20),
          Center(child: child)
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
