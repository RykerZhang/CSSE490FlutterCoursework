void main() {
  print("Functions");
  print("addTwoNumbers(2,3) ${addTwoNumbers(2, 3)}");
  print("addTwoNumbersWithTPES(2,3) ${addTwoNumberWithTypes(2, 3)}");
  print("addTwoNumbersShorter(2,3) ${addTwoNumbersShorter(2, 3)}");
}

int addTwoNumbers(a, b) {
  return a + b;
}

int addTwoNumberWithTypes(int a, int b) {
  return a + b;
}

int addTwoNumbersShorter(a, b) => a + b;
