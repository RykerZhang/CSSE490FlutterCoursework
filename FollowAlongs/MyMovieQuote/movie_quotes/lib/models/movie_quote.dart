import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quotes/models/firestore_model_content_util.dart';

const String kMovieQuoteCollectionPath = "MovieQuotes";
const String kMovieQuote_quote = "quote";
const String kMovieQuote_movie = "movie";
const String kMovieQuote_lastTouched = "lastTouched";
const String kMovieQuote_authorUid = "authorUid";

class MovieQuote {
  String? documentId;
  String authorUid;
  String quote;
  String movie;
  Timestamp lastTouched;

  MovieQuote({
    this.documentId,
    required this.quote,
    required this.movie,
    required this.lastTouched,
    required this.authorUid,
  });

  MovieQuote.from(DocumentSnapshot doc)
      : this(
          documentId: doc.id,
          authorUid:
              FirestoreModelUtils.getStringField(doc, kMovieQuote_authorUid),
          quote: FirestoreModelUtils.getStringField(doc, kMovieQuote_quote),
          movie: FirestoreModelUtils.getStringField(doc, kMovieQuote_movie),
          lastTouched: FirestoreModelUtils.getTimestampField(
              doc, kMovieQuote_lastTouched),
        );

  @override
  String toString() {
    return "$quote from the movie $movie";
  }
}
