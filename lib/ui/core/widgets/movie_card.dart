import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/app_text_styles.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.red,
                    size: 25,
                  ),
                ),
                errorWidget: (context, url, error) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                imageUrl:
                    'https://m.media-amazon.com/images/M/MV5BMDg2Y2UxYTItMTViNi00ODA5LTljM2ItYzhiZDZmODQwOTE0XkEyXkFqcGc@._V1_.jpg',
              ),
              const SizedBox(height: 15),
              const Text(
                'Demon Slayer',
                style: AppTextStyles.titleRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                '2019',
                style: AppTextStyles.subtitleSmall,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 50,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
