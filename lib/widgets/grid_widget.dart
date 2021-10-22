import 'package:flutter/material.dart';
import 'package:tetris_game/models/grid.dart';

class GridWidget extends StatelessWidget {
  final int gridWidth;
  final int gridHeight;
  final List<int>? tetrisPice;
  final Grid? grid;

  GridWidget(
      {Key? key,
      this.gridWidth = 4,
      this.gridHeight = 4,
      required this.tetrisPice,
      required this.grid}); //{
  //   this.grid = Grid(width: gridWidth, height: gridHeight);
  // } // implement throw an exeption if gridWidth and gridHeit be both less than 4

  Color color(int index, Color blockColor, Color gridColor) {
    if (tetrisPice!.any((element) => element == index)) {
      return blockColor;
    }
    if (grid!.me[index] == 1) {
      return blockColor;
    }
    return gridColor;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridWidth),
        itemCount: gridWidth * (gridHeight + 1),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 5,
            width: 5,
            child: Block(
              color: color(
                  index + gridWidth * 2,
                  Theme.of(context).primaryColor,
                  Theme.of(context).scaffoldBackgroundColor),
              // child: Text('$index'),
            ),
          );
        });
  }
}

class Block extends StatelessWidget {
  final Color? color;
  const Block({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor.withOpacity(0.2))),
    );
  }
}
