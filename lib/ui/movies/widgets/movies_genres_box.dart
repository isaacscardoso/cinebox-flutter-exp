import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';

final class MoviesGenresBox extends ConsumerStatefulWidget {
  const MoviesGenresBox({super.key});

  @override
  ConsumerState createState() => _MoviesGenresBoxState();
}

final class _MoviesGenresBoxState extends ConsumerState<MoviesGenresBox> {
  final selectedGenre = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              selectedGenre.value = index;
            },
            child: ValueListenableBuilder(
              valueListenable: selectedGenre,
              builder: (_, value, _) {
                return Container(
                  margin: EdgeInsets.only(right: index == 29 ? 16 : 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: value == index ? AppColors.red : AppColors.darkGrey,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: AppTextStyles.regularSmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
