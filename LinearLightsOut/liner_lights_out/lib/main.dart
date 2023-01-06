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

  // String getPic(int i) {
  //   if (game.board[i] == LightsMark.off) {
  //     return "assets/images/Off.png";
  //   } else {
  //     return "assets/images/On.png";
  //   }
  // }

  String get gameStateString {
    switch (game.state) {
      case LightsState.allOff:
        int count = game.pressCount;
        return "You won in $count times!";
        break;
      case LightsState.allOn:
        int count = game.pressCount;
        return "You won in $count times!";
        break;
      case LightsState.inGame:
        int count = game.pressCount;
        return "Num of moves: $count";
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
                left: (MediaQuery.of(context).size.width) / 2 - 160,
                child: Text(
                  gameStateString,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              //button #0
              Positioned(
                top: 550,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: (game.board[0] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(0);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button #1
              Positioned(
                top: 450,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: (game.board[1] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(1);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button #2
              Positioned(
                top: 350,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: (game.board[2] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(2);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button #3
              Positioned(
                top: 250,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: (game.board[3] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(3);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button #4
              Positioned(
                top: 150,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: (game.board[4] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(4);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button #5
              Positioned(
                top: 50,
                left: (MediaQuery.of(context).size.width) / 2 - 180,
                child: IconButton(
                  icon: (game.board[5] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(5);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button #6
              Positioned(
                top: 50,
                left: (MediaQuery.of(context).size.width) / 2 - 40,
                child: IconButton(
                  icon: (game.board[6] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(6);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button 7
              Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width) / 2 + 70,
                child: IconButton(
                  icon: (game.board[7] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(7);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button 8
              Positioned(
                top: 200,
                left: (MediaQuery.of(context).size.width) / 2 + 90,
                child: IconButton(
                  icon: (game.board[8] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(8);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button 9
              Positioned(
                top: 300,
                left: (MediaQuery.of(context).size.width) / 2 + 70,
                child: IconButton(
                  icon: (game.board[9] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(9);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button 10
              Positioned(
                top: 350,
                left: (MediaQuery.of(context).size.width) / 2 - 40,
                child: IconButton(
                  icon: (game.board[10] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(10);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button 11
              Positioned(
                top: 450,
                left: (MediaQuery.of(context).size.width) / 2 + 20,
                child: IconButton(
                  icon: (game.board[11] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(11);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              //button 12
              Positioned(
                top: 550,
                left: (MediaQuery.of(context).size.width) / 2 + 100,
                child: IconButton(
                  icon: (game.board[12] == LightsMark.off)
                      ? Image.asset("assets/images/light_off.png")
                      : Image.asset("assets/images/light_on.png"),
                  iconSize: 75,
                  onPressed: () {
                    setState(() {
                      game.pressLight(12);
                    });
                    game.checkEnd();
                  },
                ),
              ),
              Positioned(
                top: 650,
                left: (MediaQuery.of(context).size.width) / 2 - 100,
                child: TextButton(
                  onPressed: () {
                    print("You pressed new game.");
                    setState(() {
                      game = LinearLightsOutGame();
                    });
                  },
                  child:
                      const Text('New Game', style: TextStyle(fontSize: 30.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
