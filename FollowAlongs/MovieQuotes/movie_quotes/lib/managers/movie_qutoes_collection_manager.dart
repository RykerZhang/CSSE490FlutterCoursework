import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_quote.dart';

class MovieQuotesCollectionManager {
  List<MovieQuote> latestMovieQuotes = [];
  final CollectionReference _ref;

  static final MovieQuotesCollectionManager instance =
      MovieQuotesCollectionManager._privateConstructor();

  MovieQuotesCollectionManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kMovieQuoteCollectionPath);

  StreamSubscription startListening(Function() observer) {
    return _ref
        .orderBy(kMovieQuote_lastTouched, descending: true)
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      print(querySnapshot.docs);
      latestMovieQuotes =
          querySnapshot.docs.map((doc) => MovieQuote.from(doc)).toList();
      observer();
    });
  }

  void stopListening(StreamSubscription subscription) {
    subscription.cancel();
  }

  //TODO: make a stop listening
  Future<void> add({
    required String quote,
    required String movie,
  }) {
    //     // Call the user's CollectionReference to add a new user
    return _ref
        .add({
          kMovieQuote_quote: quote,
          kMovieQuote_movie: movie,
          kMovieQuote_lastTouched: Timestamp.now(),
        })
        .then((DocumentReference docRef) => print("MovieQuote add with id"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
