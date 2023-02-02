import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_quote.dart';

class MovieQuoteDocumentManager {
  MovieQuote? latesMovieQuote;
  final CollectionReference _ref;

  static final MovieQuoteDocumentManager instance =
      MovieQuoteDocumentManager._privateConstructor();

  MovieQuoteDocumentManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kMovieQuoteCollectionPath);

  StreamSubscription startListening(String documentId, Function() observer) {
    return _ref
        .doc(documentId)
        .snapshots()
        .listen((DocumentSnapshot docSnapshot) {
      latesMovieQuote = MovieQuote.from(docSnapshot);
      observer();
    });
  }

  void stopListening(StreamSubscription subscription) {
    subscription.cancel();
  }

  Future<void> add({
    required String quote,
    required String movie,
  }) {
    return _ref
        .add({
          kMovieQuote_quote: quote,
          kMovieQuote_movie: movie,
          kMovieQuote_lastTouched: Timestamp.now(),
        })
        .then((DocumentReference docRef) => print("MovieQuote add with id"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void update({
    required String quote,
    required String movie,
  }) {
    if (latesMovieQuote == null) {
      return;
    }
    _ref.doc(latesMovieQuote!.documentId!).update({
      kMovieQuote_quote: quote,
      kMovieQuote_movie: movie,
      kMovieQuote_lastTouched: Timestamp.now(),
    }).catchError((error) => print("Failed to add user: $error"));
  }

  void delete() {
    if (latesMovieQuote == null) {
      return;
    } else {
      _ref.doc(latesMovieQuote?.documentId!).delete();
    }
  }
}
