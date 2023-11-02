import 'package:flutter/material.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';

class TopWidget extends StatelessWidget {
  final String amount;

  const TopWidget({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.blue.withOpacity(0.8),
            AppColors.white,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 0.5),
            blurRadius: 0.5,
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Text('$kExpensesOffThisMonth \n$amount',
          textAlign: TextAlign.center,
          style: AppTextStyles.style600.copyWith(fontSize: 20)),
    );
  }
}
