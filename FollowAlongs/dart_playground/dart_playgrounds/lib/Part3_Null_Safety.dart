import 'package:flutter/material.dart';

void main() {
  print("Null Safety");
  //double? nullableDouble = null; Can compile
  //double nonNullableDouble = null; Won't compile

  double? nullableDouble;

  //See how this works with objects
  // '?' optional chaining. If this thing is non-null do the next step
  // '!' forced unwrapping. I as the developer promise this thing is not null;
  // print(nullableDouble!) // crash at runtime since mypromise is wrong

  //late variable type -- non-null forever
  late double willBeNonNull;

  ElevatedButton? button;
  button = ElevatedButton(onPressed: null, child: null);
  if (7 > 6) {
    Text? txt = const Text("Hello World");
    txt = null;
    button = ElevatedButton(onPressed: null, child: txt);
  } else {
    button = null;
  }
  print("button = $button");
  print("Button's child text = ${button?.child}");

  print("Data = ${((button?.child) as Text?)?.data}");

  //protects only against a null button. Goal to crash on a null text
  print("Data = ${((button?.child) as Text).data}");
  //protects only against a null child. Goal to crash on a null button
  //print("Data = ${((button!.child)as Text?)?.data}");
}
