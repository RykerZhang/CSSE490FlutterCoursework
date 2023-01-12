import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/movie_quote.dart';

class MovieQuoteDetailPage extends StatefulWidget {
  final MovieQuote mq;
  const MovieQuoteDetailPage(this.mq, {super.key});

  @override
  State<MovieQuoteDetailPage> createState() => _MovieQuoteDetailPageState();
}

class _MovieQuoteDetailPageState extends State<MovieQuoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Movie Quote"), actions: [
          IconButton(
            onPressed: () {
              print("You pressed the menu");
              Navigator.pop(context);
            },
            icon: const Icon(Icons.edit),
          )
        ]),
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [Text(widget.mq.movie), Text(widget.mq.quote)],
        ));
  }
}
