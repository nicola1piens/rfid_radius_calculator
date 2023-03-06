class Circle {
  late int _id;
  late double _x;
  late double _y;
  late double _radius;

  Circle(int id, double x, double y, double radius) {
    _id = id;
    _x = x;
    _y = y;
    _radius = radius;
  }

  // getters and setters for the private fields

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  double get x => _x;

  set x(double value) {
    _x = value;
  }

  double get y => _y;

  set y(double value) {
    _y = value;
  }

  double get radius => _radius;

  set radius(double value) {
    _radius = value;
  }
}