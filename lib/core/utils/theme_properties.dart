import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';

class ThemeProperties {
  ///light theme properties
  static final card = CardTheme(
    color: AppColors.white,
    shadowColor: AppColors.darkBackground,
  );

  static final icon = IconThemeData(color: AppColors.black);

  static final appBar = AppBarTheme(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: AppColors.background,
    shadowColor: AppColors.darkBackground,
    actionsIconTheme: IconThemeData(color: AppColors.black),
    iconTheme: IconThemeData(color: AppColors.black),
    titleTextStyle: AppTextStyles.style600.copyWith(
      fontSize: 20,
      color: AppColors.black,
    ),
  );

  static final bottomAppBar = BottomAppBarTheme(
    elevation: 0.5,
    shadowColor: AppColors.darkBackground,
  );

  static final inputDecoration = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    fillColor: Colors.white,
    filled: true,
    hintStyle: AppTextStyles.style400.copyWith(fontSize: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.card, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.green, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.red, width: 1),
    ),
  );

  static final floatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary.withOpacity(0.2),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.lightGreen,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: AppTextStyles.style500.copyWith(color: AppColors.green),
      padding: const EdgeInsets.symmetric(horizontal: 6),
    ),
  );

  static final textButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppTextStyles.style600.copyWith(
        color: AppColors.green,
        fontSize: 20,
      ),
    ),
  );

  static final text = TextTheme(
    labelLarge: AppTextStyles.style600.copyWith(color: AppColors.green),
  );

  static final divider = DividerThemeData(
    color: AppColors.darkBackground,
    thickness: 0,
  );

  ///Dark theme properties
  static final darkCard = CardTheme(
    color: AppColors.darCard,
    shadowColor: AppColors.grey,
  );

  static final darkIcon = IconThemeData(color: AppColors.white);

  static final darkAppBar = AppBarTheme(
    elevation: 0.5,
    centerTitle: true,
    shadowColor: AppColors.background,
    backgroundColor: AppColors.darkBackground,
    actionsIconTheme: IconThemeData(color: AppColors.white),
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: AppTextStyles.style600.copyWith(
      fontSize: 20,
      color: AppColors.white,
    ),
  );

  static final darkBottomAppBar = BottomAppBarTheme(
    elevation: 0.5,
    shadowColor: AppColors.background,
  );

  static final darkFloatingActionButton = FloatingActionButtonThemeData(
      backgroundColor: AppColors.green.withOpacity(0.2),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

  static final darkInputDecoration = InputDecorationTheme(
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
  );

  static final darkElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darCard,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: AppTextStyles.style500.copyWith(color: AppColors.green),
      padding: const EdgeInsets.symmetric(horizontal: 6),
    ),
  );

  static final darkTextButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppTextStyles.style600.copyWith(
        color: AppColors.green,
        fontSize: 20,
      ),
    ),
  );

  static final darkText = TextTheme(
    labelLarge: AppTextStyles.style600.copyWith(color: AppColors.green),
  );

  static final darkDivider = DividerThemeData(
    color: AppColors.background,
    thickness: 0,
  );
}
