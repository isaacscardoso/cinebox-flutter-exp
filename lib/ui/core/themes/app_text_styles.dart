import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static const titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const subtitleSmall = TextStyle(
    fontSize: 14,
    color: AppColors.lightGrey,
  );

  static const boldSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const boldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const boldLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const semiBoldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const regularSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const lightGreyRegular = TextStyle(
    fontSize: 14,
    color: AppColors.lightGrey,
  );

  static const darkGreyRegular = TextStyle(
    fontSize: 14,
    color: AppColors.darkGrey,
  );

  static const lightGreySmall = TextStyle(
    fontSize: 12,
    color: AppColors.lightGrey,
  );

  static const selectedTextSmall = TextStyle(
    fontSize: 12,
    color: AppColors.red,
  );

  static const unselectedTextSmall = TextStyle(
    fontSize: 10,
    color: AppColors.lightGrey,
    fontWeight: FontWeight.w400,
  );

  static const errorText = TextStyle(
    color: AppColors.red,
  );
}
