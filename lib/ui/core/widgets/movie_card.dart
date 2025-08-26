import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class MovieCard extends ConsumerStatefulWidget {
  const MovieCard({super.key});

  @override
  ConsumerState createState() => _MovieCardState();
}

final class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 148,
          height: 250,
          child: Column(
            children: <Widget>[
              Image.network(
                'https://m.media-amazon.com/images/M/MV5BMDg2Y2UxYTItMTViNi00ODA5LTljM2ItYzhiZDZmODQwOTE0XkEyXkFqcGc@._V1_.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
