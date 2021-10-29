class Grid {
  final int width;
  final int height;
  int numberOfFullLines = 0;
  List<int> me = []; // maybe raname this thing
  Grid({this.width = 0, this.height = 0}) {
    me = List<int>.generate(width * (height + 4), (index) {
      if (index >= width * (height + 3)) return 1;
      return 0;
    });
  }
  set setIndex(int index) {
    me[index] = 1;
  }

  void reorganize(int line) {
    for (int i = 0; i < width; i++) {
      me[i] = 0;
    }
    int j = line;
    while (j > 1) {
      for (int k = 0; k < width; k++) {
        me[j * width + k] = me[(j - 1) * width + k];
      }
      j--;
    }
  }

  void checkFullBlueLine() {
    for (int i = 0; i < height + 3; i++) {
      int _sum = 0;
      for (int j = 0; j <= width; j++) {
        if (me[width * i + j] == 1) _sum += 1;
      }
      // if a full blue line is done
      if (_sum == width + 1) {
        numberOfFullLines++;
        reorganize(i);
      }
    }
  }

  bool checkGameOver() {
    bool isGameOver = false;
    for (int index = 0; index < width * 3; index++) {
      if (me[index] == 1) return true;
    }
    return isGameOver;
  }

  void clear() {
    me = List<int>.generate(width * (height + 4), (index) {
      if (index >= width * (height + 3)) return 1;
      return 0;
    });
  }
}
