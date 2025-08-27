import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_box.dart';

final class MoviesByCategory extends ConsumerStatefulWidget {
  const MoviesByCategory({super.key});

  @override
  ConsumerState createState() => _MoviesByCategoryState();
}

final class _MoviesByCategoryState extends ConsumerState<MoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 130),
      child: Column(
        children: <Widget>[
          MoviesBox(title: 'Mais Populares'),
          MoviesBox(title: 'Top Filmes'),
        ],
      ),
    );
  }
}
