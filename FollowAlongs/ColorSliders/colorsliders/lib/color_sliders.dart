import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_slider_component.dart';

// class ColorSlidersPage extends StatefulWidget {
//   const ColorSlidersPage({super.key});

//   @override
//   State<ColorSlidersPage> createState()=>_ColorSlidersPageState()
// }

// class _ColorSlidersPageState extends State<ColorSlidersPage> {

//   Widget build(BuildContext context){
//     return Scaffold(appBar: AppBar(title: const Text("Color Sliders")));
//   }
// }

class ColorSlidersPage extends StatefulWidget {
  const ColorSlidersPage({super.key});

  @override
  State<ColorSlidersPage> createState() => _ColorSlidersPageState();
}

class _ColorSlidersPageState extends State<ColorSlidersPage> {
  double redValue = 0.5;
  double greenValue = 0.6;
  double blueValue = 0.7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Sliders")),
      body: Column(children: [
        ColorSlider(
          title: "Red",
          value: redValue,
          color: Colors.red,
          onChange: (newvalue) {
            setState(() {
              redValue = newvalue;
            });
          },
        ),
        ColorSlider(
          title: "Green",
          value: greenValue,
          color: Colors.green,
          onChange: (newvalue) {
            setState(() {
              greenValue = newvalue;
            });
          },
        ),
        ColorSlider(
          title: "Blue",
          value: blueValue,
          color: Colors.blue,
          onChange: (newvalue) {
            setState(() {
              blueValue = newvalue;
            });
          },
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.all(20.0),
              color: Color.fromRGBO(
                (redValue * 255).round(),
                (greenValue * 255).round(),
                (blueValue * 255).round(),
                1.0,
              )),
        )
      ]),
    );
  }
}
