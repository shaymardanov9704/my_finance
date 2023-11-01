import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_finance/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      fontFamily: GoogleFonts.questrial().fontFamily,
      primarySwatch: Colors.green,
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
          fontFamily: "Questrial",
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
          fontFamily: "Questrial",
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
      fontFamily: GoogleFonts.questrial().fontFamily,
      primarySwatch: Colors.blue,
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
          fontFamily: "Questrial",
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
          fontFamily: "Questrial",
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
