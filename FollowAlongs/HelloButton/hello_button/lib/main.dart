import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Button',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Hello Button Page'),
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
  int _counter = 0;

  void _changeCounter(int amount) {
    setState(() {
      _counter += amount;
    });
  }

  void _setCounter(int amount) {
    setState(() {
      _counter = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print("You pressed Decrement.");
                    _changeCounter(-1);
                  },
                  child: const Text('Decrement'),
                ),
                //Container()
                Container(
                  height: 200,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      print("You press reset");
                      _setCounter(0);
                    },
                    child: const Text("Reset"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("You pressed increment.");
                    _changeCounter(1);
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    onPressed: () {
                      print("You pressed Decrement.");
                      _changeCounter(-1);
                    },
                    child: const Text('Decrement'),
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    onPressed: () {
                      print("You press reset");
                      _setCounter(0);
                    },
                    child: const Text("Reset"),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    onPressed: () {
                      print("You pressed increment.");
                      _changeCounter(1);
                    },
                    child: const Text('Increment'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
