class Building {
  static String _image = "grondplan.jpg";
  late double _xLeft;
  late double _xRight;
  late double _yBottom;
  late double _yTop;

  Building(String image, double xLeft, double xRight, double yBottom, double yTop) {
    _image = image;
    _xLeft = xLeft;
    _xRight = xRight;
    _yBottom = yBottom;
    _yTop = yTop;
  }

  // getters and setters for the private fields

  String get image => _image;

  double get xLeft => _xLeft;

  set xLeft(double value) {
    _xLeft = value;
  }

  double get xRight => _xRight;

  set xRight(double value) {
    _xRight = value;
  }

  double get yBottom => _yBottom;

  set yBottom(double value) {
    _yBottom = value;
  }

  double get yTop => _yTop;

  set yTop(double value) {
    _yTop = value;
  }
}
