void main() {
  print("Functions");
  print("addTwoNumbers(2,3) ${addTwoNumbers(2, 3)}");
  print("addTwoNumbersWithTPES(2,3) ${addTwoNumberWithTypes(2, 3)}");
  print("addTwoNumbersShorter(2,3) ${addTwoNumbersShorter(2, 3)}");
  print(
      "divideWithNamedParameters{dividend: 7} ${divideWithNamedParameters(dividend: 7)}");
  print(
      "divideWithNamedParameters{dividend: 7} ${divideWithNamedParameters(dividend: 7, divisor: 2)}");
  //print(mixedSet{2, dividend: 8, divisor: 3});
}

int addTwoNumbers(a, b) {
  return a + b;
}

int addTwoNumberWithTypes(int a, int b) {
  return a + b;
}

int addTwoNumbersShorter(a, b) => a + b;

int divideWithNamedParameters({required int dividend, int divisor = 1}) {
  return dividend ~/ divisor;
}

int mixed(int multiplier, {required int dividend, int divisor = 1}) {
  return multiplier * dividend ~/ divisor;
}

int notUsedByFlutter(int a, {int b = 0, int c = 0}) {
  return a + b + c;
}
