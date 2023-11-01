import 'package:flutter/material.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomSwitchThemeWidget extends StatelessWidget {
  const CustomSwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
      value: themeProvider.currentTheme.brightness == Brightness.dark,
      activeColor: AppColors.green.withOpacity(0.4),
      inactiveThumbColor: AppColors.green,
      inactiveTrackColor: AppColors.white,
      activeTrackColor: AppColors.green,
      onChanged: (value) {
        if (value) {
          themeProvider.setTheme(1); // Set dark theme
        } else {
          themeProvider.setTheme(0); // Set light theme
        }
      },
    );
  }
}
