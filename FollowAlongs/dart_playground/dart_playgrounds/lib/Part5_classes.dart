void main() {
  print("Classes");
  var pt = DoublePoint(2, 5);
  print("pt = ${pt.x} ${pt.y} $pt");
}

//Class DoublePoint
// var pt = DoublePoint(2,5);

class DoublePoint {
  late double x;
  late double y;

  DoublePoint(x, y) {
    this.x = x * 2.0;
    this.y = y * 2.0;
  }

  DoublePoint.empty() {
    this.x = 0;
    this.y = 0;
  }

  @override
  String toString() {
    return "(${this.x}, ${this.y})";
  }
}
