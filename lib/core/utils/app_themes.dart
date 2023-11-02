import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/core/utils/theme_properties.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.green,
      primaryColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.light,
      dividerColor: Colors.transparent,
      cardTheme: ThemeProperties.card,
      iconTheme: ThemeProperties.icon,
      floatingActionButtonTheme: ThemeProperties.floatingActionButton,
      appBarTheme: ThemeProperties.appBar,
      inputDecorationTheme: ThemeProperties.inputDecoration,
      bottomAppBarTheme: ThemeProperties.bottomAppBar,
      elevatedButtonTheme: ThemeProperties.elevatedButton,
      textButtonTheme: ThemeProperties.textButton,
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
      cardTheme: ThemeProperties.darkCard,
      iconTheme: ThemeProperties.darkIcon,
      appBarTheme: ThemeProperties.darkAppBar,
      floatingActionButtonTheme: ThemeProperties.darkFloatingActionButton,
      inputDecorationTheme: ThemeProperties.darkInputDecoration,
      bottomAppBarTheme: ThemeProperties.darkBottomAppBar,
      elevatedButtonTheme: ThemeProperties.darkElevatedButton,
      textButtonTheme: ThemeProperties.darkTextButton,
    );
  }
}
