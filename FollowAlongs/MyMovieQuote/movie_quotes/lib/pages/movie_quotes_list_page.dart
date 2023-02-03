import 'dart:async';

import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_quotes/components/list_page_side_drawer.dart';
import 'package:movie_quotes/components/movie_quote_row_component.dart';
import 'package:movie_quotes/models/movie_quote.dart';

import '../managers/movie_qutoes_collection_manager.dart';
import '../models/auth_manager.dart';
import 'login_front_page.dart';
import 'movie_quotes_detail_page.dart';

class MovieQuotesListPage extends StatefulWidget {
  const MovieQuotesListPage({super.key});

  @override
  State<MovieQuotesListPage> createState() => _MovieQuotesListPageState();
}

class _MovieQuotesListPageState extends State<MovieQuotesListPage> {
  // final quotes = <MovieQuote>[]; // Later we will remove this and use Firestore
  final quoteTextController = TextEditingController();
  final movieTextController = TextEditingController();

  // StreamSubscription? movieQuotesSubscription;
  bool _isShowingAllQuotes = true;

  UniqueKey? _loginObserverKey;
  UniqueKey? _logoutObserverKey;

  @override
  void initState() {
    super.initState();

    _showAllQuotes();

    _loginObserverKey = AuthManager.instance.addLoginObserver(() {
      setState(() {});
    });

    _logoutObserverKey = AuthManager.instance.addLogoutObserver(() {
      _showAllQuotes();
      setState(() {});
    });
  }

  void _showAllQuotes() {
    setState(() {
      _isShowingAllQuotes = true;
    });
    // MovieQuotesCollectionManager.instance
    //     .stopListening(movieQuotesSubscription); // Just in case.
    // movieQuotesSubscription =
    //     MovieQuotesCollectionManager.instance.startListening(() {
    //   setState(() {});
    // });
  }

  void _showOnlyMyQuotes() {
    setState(() {
      _isShowingAllQuotes = false;
    });
    // MovieQuotesCollectionManager.instance
    //     .stopListening(movieQuotesSubscription); // Just in case.
    // movieQuotesSubscription =
    //     MovieQuotesCollectionManager.instance.startListening(
    //   () {
    //     setState(() {});
    //   },
    //   isFilteredForMine: true,
    // );
  }

  @override
  void dispose() {
    quoteTextController.dispose();
    movieTextController.dispose();
    // MovieQuotesCollectionManager.instance
    //     .stopListening(movieQuotesSubscription);
    AuthManager.instance.removeObserver(_loginObserverKey);
    AuthManager.instance.removeObserver(_logoutObserverKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<MovieQuoteRow> movieRows =
    // MovieQuotesCollectionManager.instance.latestMovieQuotes
    //     .map((mq) => MovieQuoteRow(
    //           movieQuote: mq,
    //           onTap: () async {
    //             print(
    //                 "You clicked on the movie quote ${mq.quote} - ${mq.movie}");
    //             await Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (BuildContext context) {
    //                   return MovieQuoteDetailPage(
    //                       mq.documentId!); // In Firebase use a documentId
    //                 },
    //               ),
    //             );
    //             setState(() {});
    //           },
    //         ))
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes"),
        actions: AuthManager.instance.isSignedIn
            ? null
            : [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginFrontPage();
                      },
                    ));
                  },
                  tooltip: "Log in",
                  icon: const Icon(Icons.login),
                ),
              ],
      ),
      backgroundColor: Colors.grey[100],
      // body: ListView(
      //   children: movieRows,
      // ),
      body: FirestoreListView<MovieQuote>(
        query: _isShowingAllQuotes
            ? MovieQuotesCollectionManager.instance.allMovieQuotesQuery
            : MovieQuotesCollectionManager.instance.mineONlyMovieQuotesQuery,
        itemBuilder: (context, snapshot) {
          MovieQuote mq = snapshot.data();
          return MovieQuoteRow(
            movieQuote: mq,
            onTap: () async {
              print("You clicked on the movie quote ${mq.quote} - ${mq.movie}");
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MovieQuoteDetailPage(
                        mq.documentId!); // In Firebase use a documentId
                  },
                ),
              );
              setState(() {});
            },
          );
        },
      ),
      drawer: AuthManager.instance.isSignedIn
          ? ListPageSideDrawer(
              showAllCallback: () {
                print("MovieQuoteListPage: Callback to Show all quotes");
                _showAllQuotes();
              },
              showOnlyMineCallback: () {
                print("MovieQuoteListPage: Callback to Show only my quotes");
                _showOnlyMyQuotes();
              },
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (AuthManager.instance.isSignedIn) {
            showCreateQuoteDialog(context);
          } else {
            showMustLogInDialog(context);
          }
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
          title: const Text('Create a Movie Quote'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
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
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
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
                  MovieQuotesCollectionManager.instance.add(
                    quote: quoteTextController.text,
                    movie: movieTextController.text,
                  );
                  quoteTextController.text = "";
                  movieTextController.text = "";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMustLogInDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login Required"),
          content: const Text(
              "You must be signed in to post.  Would you like to sign in now?"),
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
              child: const Text("Go sign in"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LoginFrontPage();
                  },
                ));
              },
            ),
          ],
        );
      },
    );
  }
}
