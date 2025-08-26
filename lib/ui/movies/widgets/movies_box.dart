import 'package:flutter/material.dart';

import '../../core/themes/app_text_styles.dart';
import '../../core/widgets/movie_card.dart';

final class MoviesBox extends StatelessWidget {
  final String title;

  const MoviesBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 32, bottom: 24),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: AppTextStyles.titleLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 253,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const MovieCard();
            },
          ),
        ),
      ],
    );
  }
}
