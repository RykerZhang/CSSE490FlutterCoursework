import 'package:flutter/material.dart';

import 'Tic_Tac_Toe_Game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
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
  var game = TicTacToeGame();

  String get gameStateString {
    switch (game.state) {
      case TicTacToeState.xTurn:
        // TODO: Handle this case.
        return "X's Turn";
        break;
      case TicTacToeState.oTurn:
        // TODO: Handle this case.
        return "O's Turn";
        break;
      case TicTacToeState.xWon:
        // TODO: Handle this case.
        return "X won";
        break;
      case TicTacToeState.oWon:
        // TODO: Handle this case.
        return "O won";
        break;
      case TicTacToeState.tie:
        // TODO: Handle this case.
        return "Tie game!";
        break;
    }
    return 'Test';
  }

  @override
  Widget build(BuildContext context) {
    final squareButtons = <ElevatedButton>[];
    for (var k = 0; k < 9; k++) {
      squareButtons.add(
        ElevatedButton(
          onPressed: () {
            print("You pressed button number $k");
          },
          child: Text(
            "x",
            style: TextStyle(fontSize: 90),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              gameStateString,
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: squareButtons,
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
