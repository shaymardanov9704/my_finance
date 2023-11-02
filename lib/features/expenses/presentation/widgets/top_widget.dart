import 'package:flutter/material.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class TopWidget extends StatelessWidget {
  final String amount;

  const TopWidget({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.repeated,
          colors: isDark
              ? [
                  AppColors.darCard,
                  AppColors.darkBackground,
                ]
              : [
                  AppColors.card,
                  AppColors.white,
                ],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.green : AppColors.black,
            offset: const Offset(0.6, 0.6),
            blurRadius: 0.4,
            spreadRadius: 0.4,
          )
        ],
      ),
      child: Text(
        '$kExpensesOffThisMonth \n$amount',
        textAlign: TextAlign.center,
        style: AppTextStyles.style600.copyWith(fontSize: 20),
      ),
    );
  }
}
