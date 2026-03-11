import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimary,
  colorScheme: ColorScheme.light(
    primary: AppColors.lightPrimary,
    secondary: AppColors.lightSecondary,
    surface: AppColors.lightSurface,
    onPrimary: AppColors.lightText,
    onSecondary: AppColors.lightText,
    onSurface: AppColors.lightText,
  ),
  scaffoldBackgroundColor: AppColors.lightBackground,
);
