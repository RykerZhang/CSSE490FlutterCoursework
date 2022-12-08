void main() {
  print("Collections");
  //lists();
  sets();
  maps();
}

void lists() {
  // var scores = [72, 52, 93, 87, 41, 83];
  final scores = [72, 52, 93, 87, 41, 83];
  //const scores = [72, 52, 93, 87, 41, 83]; cannot modify a constant
  print("values: $scores");
  //when something need execuion, then we need brackets
  print("types: ${scores.runtimeType}");
  scores[1] = 100;
  scores.add(33);
  print("values: $scores");
  print("Index 1 --> ${scores[1]}");

  final List<int> emptyStartingList = [];
  print("Empty list $emptyStartingList");

  //enchanced for loop
  var totalPassing = 0;
  for (var score in scores) {
    if (score > 60) {
      totalPassing++;
    }
  }
  print("$totalPassing people passed out of ${scores.length}");

  //index based loop
  var evenSum = 0;
  for (var k = 0; k < scores.length; k = k + 2) {
    evenSum += scores[k];
  }
  print("Sum of evenindicies is $evenSum from $scores");

  scores.forEach((element) {
    print(element);
  });

  scores.asMap().forEach((key, value) {
    print("Index: $key Value: $value");
  });
}

void sets() {
  final setOfInts = <int>{};
  final Set<int> set2 = {};
  final set3 = {3, 4, 5, 6, 67};
  print("$setOfInts, $set2, $set3");
  set3.add(17);
  set3.add(5);
  print("After:$set3");
}

void maps() {
  final mapOfInts = <String, int>{};
  final map2 = {"Dave": 43, "McKinley": 12};
  print("$mapOfInts $map2");
  print("${map2['Dave']}");
  print("${map2['Bob']}");
}
