import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoveTetrisRight extends Intent {}

class MoveTetrisLeft extends Intent {}

class MoveTetrisDown extends Intent {}

class TetrisRotate extends Intent {}

class TetrisGame extends StatelessWidget {
  const TetrisGame(this.child,
      {Key? key,
      @required this.onMoveLeft,
      @required this.onMoveRight,
      @required this.rotate,
      @required this.moveDown})
      : super(key: key);
  final Widget child;
  final VoidCallback? onMoveRight;
  final VoidCallback? onMoveLeft;
  final VoidCallback? moveDown;
  final VoidCallback? rotate;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
        autofocus: true,
        shortcuts: {
          incrementX: MoveTetrisRight(),
          decrementX: MoveTetrisLeft(),
          tetrisMoveDown: MoveTetrisDown(),
          tetrisRotate: TetrisRotate()
        },
        actions: {
          MoveTetrisLeft: CallbackAction(onInvoke: (e) => onMoveLeft?.call()),
          MoveTetrisRight: CallbackAction(onInvoke: (e) => onMoveRight?.call()),
          MoveTetrisDown: CallbackAction(onInvoke: (e) => moveDown?.call()),
          TetrisRotate: CallbackAction(onInvoke: (e) => rotate?.call())
        },
        child: child);
  }
}

final incrementX = LogicalKeySet(LogicalKeyboardKey.arrowRight);
final decrementX = LogicalKeySet(LogicalKeyboardKey.arrowLeft);
final tetrisMoveDown = LogicalKeySet(LogicalKeyboardKey.arrowDown);
final tetrisRotate = LogicalKeySet(LogicalKeyboardKey.space);
