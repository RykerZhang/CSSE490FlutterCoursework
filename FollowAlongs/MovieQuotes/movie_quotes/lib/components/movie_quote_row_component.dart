import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/movie_quote.dart';

class MovieQuoteRow extends StatelessWidget {
  final MovieQuote movieQuote;
  final Function() onTap;

  const MovieQuoteRow({
    required this.movieQuote,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: const Icon(Icons.movie_creation_outlined),
        trailing: const Icon(Icons.chevron_right),
        title: Text(
          movieQuote.quote,
        ),
        subtitle: Text(
          movieQuote.movie,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
