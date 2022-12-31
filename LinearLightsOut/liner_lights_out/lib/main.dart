import 'package:flutter/material.dart';
import 'package:liner_lights_out/LinearLightsOut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinearLightsOut',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Linear Lights Out'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var game = LinearLightsOutGame();

  String get gameStateString {
    switch (game.state) {
      case LightsState.allOff:
        return "ALL OFF";
        break;
      case LightsState.allOn:
        return "ALL ON";
        break;
      case LightsState.inGame:
        return "Please Continue";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: (MediaQuery.of(context).size.width) / 2 - 120,
                child: Text(
                  gameStateString,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              //button #0
              Positioned(
                top: 600,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button #1
              Positioned(
                top: 500,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button #2
              Positioned(
                top: 400,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button #3
              Positioned(
                top: 300,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button #4
              Positioned(
                top: 200,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button #5
              Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button #6
              Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width) / 2 - 40,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button 7
              Positioned(
                top: 150,
                left: (MediaQuery.of(context).size.width) / 2 + 70,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button 8
              Positioned(
                top: 250,
                left: (MediaQuery.of(context).size.width) / 2 + 90,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button 9
              Positioned(
                top: 350,
                left: (MediaQuery.of(context).size.width) / 2 + 70,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button 10
              Positioned(
                top: 400,
                left: (MediaQuery.of(context).size.width) / 2 - 40,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button 11
              Positioned(
                top: 500,
                left: (MediaQuery.of(context).size.width) / 2,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              //button 12
              Positioned(
                top: 600,
                left: (MediaQuery.of(context).size.width) / 2 + 100,
                child: IconButton(
                  icon: Image.asset('assets/images/Off.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
