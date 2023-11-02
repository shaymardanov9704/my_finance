import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';

class ThemeProperties {
  ///light theme properties
  static final card = CardTheme(
    color: AppColors.card,
    shadowColor: AppColors.darkBackground,
  );
  static final icon = IconThemeData(color: AppColors.black);
  static final appBar = AppBarTheme(
    elevation: 0.1,
    centerTitle: true,
    backgroundColor: AppColors.appBarBack,
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
      borderSide: BorderSide(color: AppColors.background, width: 1),
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
  static const floatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    elevation: 1,
  );
  static final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.card,
      elevation: 1,
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

  ///Dark theme properties
  static final darkCard = CardTheme(
    color: AppColors.darCard,
    shadowColor: AppColors.grey,
  );
  static final darkIcon = IconThemeData(color: AppColors.white);
  static final darkAppBar = AppBarTheme(
    elevation: 0.1,
    centerTitle: true,
    shadowColor: AppColors.background,
    backgroundColor: AppColors.appBarDarkBack,
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
  static const darkFloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    elevation: 1,
  );
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
}
