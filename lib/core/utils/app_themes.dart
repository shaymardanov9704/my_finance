import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: AppColors.black),
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: AppColors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD5DDE0), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.black, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
      ),
      dividerColor: Colors.transparent,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: AppColors.black),
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: AppColors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD5DDE0), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.black, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
      ),
    );
  }
}
