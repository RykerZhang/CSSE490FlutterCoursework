void main() {
  print("variables");

  // Explicitly Typed
  double myVariable1 = 42.0;

  // Inferred type
  var myVariable2 = 52.0;

  print("Values: $myVariable1 $myVariable2");
  print("types: ${myVariable1.runtimeType} ${myVariable2.runtimeType}");

  // Variables Finals, or Constants
  final int myFinal = 7;
  // myFinal = 5; //won't compile since a final cannot be changed.

  const int myConst = 13;
  //myConst = 4; //won't compie since a const can't change.
  //const int myConst = 13+myVariable1; //won't compile since it has to execute at runtime

  print("Values: $myFinal $myConst");
  print("Types: ${myFinal.runtimeType} ${myConst.runtimeType}");

  //nullable vs non-nullable
  //int myNonNUllable; it is null but it CANNOT be null. Should use questionmark to represent nullable
  int myNonNullable = 5;
  int? myNullable;
  print("Values: $myNonNullable $myNullable");
  print("Types: ${myNonNullable.runtimeType} ${myNullable.runtimeType}");
}
