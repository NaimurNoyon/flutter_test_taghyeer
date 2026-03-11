import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.darkPrimary,
    secondary: AppColors.darkSecondary,
    surface: AppColors.darkSurface,
    onPrimary: AppColors.darkText,
    onSecondary: AppColors.darkText,
    onSurface: AppColors.darkText,
  ),
  scaffoldBackgroundColor: AppColors.darkBackground,
);
