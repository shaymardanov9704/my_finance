import 'package:flutter/material.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomSwitchThemeWidget extends StatelessWidget {
  const CustomSwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
      value: themeProvider.currentTheme.brightness == Brightness.dark,
      activeColor: Colors.transparent,
      inactiveThumbColor: Colors.transparent,
      inactiveTrackColor: Colors.transparent,
      activeThumbImage: const AssetImage("assets/icons/dark.png"),
      inactiveThumbImage: const AssetImage("assets/icons/light_mode.png"),
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
