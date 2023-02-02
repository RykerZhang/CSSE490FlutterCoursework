import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/auth_manager.dart';
import '../models/movie_quote.dart';

class MovieQuotesCollectionManager {
  List<MovieQuote> latestMovieQuotes = [];
  final CollectionReference _ref;

  static final MovieQuotesCollectionManager instance =
      MovieQuotesCollectionManager._privateConstructor();

  MovieQuotesCollectionManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kMovieQuoteCollectionPath);

  StreamSubscription startListening(Function() observer,
      {bool isFilteredForMine = false}) {
    Query query = _ref;
    if (isFilteredForMine) {
      query = query.where(kMovieQuote_authorUid,
          isEqualTo: AuthManager.instance.uid);
    }
    return query.snapshots().listen((QuerySnapshot querySnapshot) {
      print(querySnapshot.docs);
      latestMovieQuotes =
          querySnapshot.docs.map((doc) => MovieQuote.from(doc)).toList();
      observer();
    });
  }

  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }

  Future<void> add({
    required String quote,
    required String movie,
  }) {
    return _ref
        .add({
          kMovieQuote_authorUid: AuthManager.instance.uid,
          kMovieQuote_quote: quote,
          kMovieQuote_movie: movie,
          kMovieQuote_lastTouched: Timestamp.now(),
        })
        .then((DocumentReference docRef) => print("MovieQuote add with id"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
