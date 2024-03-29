import 'package:flutter/material.dart';
import 'package:movie_quotes/pages/movie_quotes_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieQuotesListPage(),
    );
  }
}

//To host: use "firebase init", choose host, put in "build/web", then do "flutter build web", then do "firebase deploy"