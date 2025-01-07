import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';


void showCustomSnackBar(BuildContext context, String message,
    {Color backgroundColor = AppColors.green,
    Duration duration = const Duration(milliseconds: 1500)}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.bold18.copyWith(color: AppColors.white),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating, // Makes it float above the content
      margin: const EdgeInsets.all(16), // Adds margin if behavior is floating
    ),
  );
}