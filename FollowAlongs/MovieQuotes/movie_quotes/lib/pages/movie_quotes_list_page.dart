import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_quotes/components/movie_quote_row_component.dart';
import 'package:movie_quotes/main.dart';
import 'package:movie_quotes/pages/movie_quotes_detail_page.dart';

import '../models/movie_quote.dart';

class MovieQuoteListPage extends StatefulWidget {
  const MovieQuoteListPage({super.key});

  @override
  State<MovieQuoteListPage> createState() => _MovieQuoteListPageState();
}

class _MovieQuoteListPageState extends State<MovieQuoteListPage> {
  final quotes = <MovieQuote>[];
  final quoteTextController = TextEditingController();
  final movieTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    quotes.add(
      MovieQuote(quote: "quote1", movie: "Movie1"),
    );
    quotes.add(
      MovieQuote(quote: "quote2", movie: "Movie3"),
    );
  }

  @override
  void dispose() {
    quoteTextController.dispose();
    movieTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<MovieQuoteRow> movieRows = [];
    // for (final movieQuote in quotes) {
    //   movieRows.add(MovieQuoteRow(movieQuote));
    // }

    //the same as the for loop
    final List<MovieQuoteRow> movieRows = quotes
        .map((mq) => MovieQuoteRow(
              movieQuote: mq,
              onTap: () {
                print("You clicked the movie ${mq.quote}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MovieQuoteDetailPage(mq);
                    },
                  ),
                );
              },
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quote"),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: movieRows,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCreateQuoteDialog(context);
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showCreateQuoteDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a movie quote'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: quoteTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the quote',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: movieTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the movie',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Create'),
              onPressed: () {
                setState(() {
                  quotes.add(
                    MovieQuote(
                        quote: quoteTextController.text,
                        movie: movieTextController.text),
                  );
                  quoteTextController.text = "";
                  movieTextController.text = "";
                });
                //TODO: Actually Create the Quote
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
