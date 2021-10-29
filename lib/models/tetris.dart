import 'dart:math';

// TODO: tem um J ou um L errado
class Tetris {
  final int gridWidth;
  List<int> _piceIndex = [Random().nextInt(4), Random().nextInt(6)];
  List<int> _nextPiceIndex = [Random().nextInt(4), Random().nextInt(6)];
  List<int> _pice = [];
  int x = 4;
  int y = 1;

  // TODO: implement a way to it aways be equal or  grather than 4
  Tetris({this.gridWidth = 4});

  List<List<List<int>>> get allPices {
    final _allPices = [
      [this.i0, this.j0, this.l0, this.o0, this.s0, this.t0, this.z0],
      [this.i1, this.j1, this.l1, this.o0, this.s1, this.t1, this.z1],
      [this.i0, this.j2, this.l2, this.o0, this.s0, this.t2, this.z0],
      [this.i1, this.j3, this.l3, this.o0, this.s1, this.t3, this.z1]
    ];
    return _allPices;
  }

  List<int> get pice {
    return allPices[_piceIndex[0]][_piceIndex[1]];
  }

  List<int> get piceIndex => _piceIndex;
  List<int> get nextPiceIndex => _nextPiceIndex;

  void newPice() {
    y = 0;
    x = gridWidth ~/ 2 - 1;
    _piceIndex = _nextPiceIndex;
    _nextPiceIndex = [Random().nextInt(4), Random().nextInt(6)];
  }

  void moveLeft() {
    if (pice.any((element) => element % gridWidth == 0)) {
      return;
    } else {
      x--;
    }
  }

  void moveRight() {
    if (pice.any((element) => (element) % gridWidth - gridWidth + 1 == 0)) {
      return;
    } else {
      x++;
    }
  }

  void moveDown() {
    y++;
  }

  void rotate() {
    if (_piceIndex[1] != 0) {
      if (pice[0] % gridWidth == 0 ||
          pice[0] % gridWidth - (gridWidth - 1) == 0) {
        return;
      } else {
        _piceIndex[0] += 1;
        _piceIndex[0] = _piceIndex[0] % 4;
      }
    } else {
      if (pice[0] % 10 == 0 ||
          pice[0] % gridWidth - (gridWidth - 1) == 0 ||
          pice[0] % gridWidth - (gridWidth - 2) == 0) {
        return;
      } else {
        _piceIndex[0] += 1;
        _piceIndex[0] = _piceIndex[0] % 4;
      }
    }
  }

  // the Is
  List<int> get i0 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 1,
      x + (2 + y) * gridWidth + 1,
      x + (3 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  List<int> get i1 {
    _pice = [
      x + (1 + y) * gridWidth,
      x + (1 + y) * gridWidth - 1,
      x + (1 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth + 2,
    ];
    return _pice;
  }

  // the Js
  List<int> get j0 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 1,
      x + (2 + y) * gridWidth + 1,
      x + (2 + y) * gridWidth,
    ];
    return _pice;
  }

  List<int> get j1 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth + 2,
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth,
    ];
    return _pice;
  }

  List<int> get j2 {
    _pice = [
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth,
      x + (2 + y) * gridWidth,
      x + (0 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  List<int> get j3 {
    _pice = [
      x + (0 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 2,
      x + (0 + y) * gridWidth,
      x + (1 + y) * gridWidth + 2,
    ];
    return _pice;
  }

  // The Ls
  List<int> get l0 {
    _pice = [
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth,
      x + (2 + y) * gridWidth,
      x + (2 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  List<int> get l1 {
    _pice = [
      x + (0 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 2,
      x + (0 + y) * gridWidth,
      x + (1 + y) * gridWidth,
    ];
    return _pice;
  }

  List<int> get l2 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (2 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth,
    ];
    return _pice;
  }

  List<int> get l3 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth,
      x + (1 + y) * gridWidth + 2,
      x + (0 + y) * gridWidth + 2,
    ];
    return _pice;
  }

  // the Os
  List<int> get o0 {
    _pice = [
      x + (0 + y) * gridWidth,
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  // the Ss
  List<int> get s0 {
    _pice = [
      x + (0 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 2,
      x + (1 + y) * gridWidth,
    ];
    return _pice;
  }

  List<int> get s1 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth,
      x + (2 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  // the Ts
  List<int> get t0 {
    _pice = [
      x + (0 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 2,
      x + (0 + y) * gridWidth,
      x + (1 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  List<int> get t1 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (0 + y) * gridWidth + 1,
      x + (2 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth,
    ];
    return _pice;
  }

  List<int> get t2 {
    _pice = [
      x + (1 + y) * gridWidth + 1,
      x + (1 + y) * gridWidth + 2,
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  List<int> get t3 {
    _pice = [
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth,
      x + (2 + y) * gridWidth,
      x + (1 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  // the Zs
  List<int> get z0 {
    _pice = [
      x + (0 + y) * gridWidth,
      x + (1 + y) * gridWidth,
      x + (0 + y) * gridWidth - 1,
      x + (1 + y) * gridWidth + 1,
    ];
    return _pice;
  }

  List<int> get z1 {
    _pice = [
      x + (0 + y) * gridWidth,
      x + (0 + y) * gridWidth - 1,
      x + (-1 + y) * gridWidth,
      x + (1 + y) * gridWidth - 1,
    ];
    return _pice;
  }
}
