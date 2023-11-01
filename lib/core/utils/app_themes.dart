import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.green,
      primaryColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.light,
      dividerColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.black),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
        elevation: 1,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: AppColors.background,
        shadowColor: AppColors.darkBackground,
        actionsIconTheme: IconThemeData(color: AppColors.black),
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: AppTextStyles.style600.copyWith(fontSize: 20),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        fillColor: Colors.white,
        filled: true,
        hintStyle: AppTextStyles.style400.copyWith(fontSize: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: AppColors.background, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.green, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: AppColors.red, width: 1),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      shadowColor: AppColors.background,
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      appBarTheme: AppBarTheme(
        elevation: 0.1,
        centerTitle: true,
        shadowColor: AppColors.background,
        backgroundColor: AppColors.darkBackground,
        actionsIconTheme: IconThemeData(color: AppColors.white),
        iconTheme: IconThemeData(color: AppColors.white),
        titleTextStyle: AppTextStyles.style600
            .copyWith(fontSize: 20, color: AppColors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
        elevation: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        fillColor: AppColors.darkBackground,
        filled: true,
        hintStyle: AppTextStyles.style400.copyWith(
          color: AppColors.green,
          fontSize: 16,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.darkBackground, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.green, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.red, width: 1),
        ),
      ),
    );
  }
}
