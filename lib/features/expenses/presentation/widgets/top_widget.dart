import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/common/words.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/expenses/data/repository/expenses_box.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ExpensesInfoWidget extends StatefulWidget {
  const ExpensesInfoWidget({Key? key}) : super(key: key);

  @override
  State<ExpensesInfoWidget> createState() => _ExpensesInfoWidgetState();
}

class _ExpensesInfoWidgetState extends State<ExpensesInfoWidget> {
  int expensesOfThisMonth(List<Expense> expenses) {
    final result = expenses.fold<int>(
      0,
      (previousValue, element) =>
          element.createdDate.month == DateTime.now().month
              ? previousValue + element.amount
              : previousValue + 0,
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return ValueListenableBuilder(
        valueListenable: ExpensesBox.getExpenses().listenable(),
        builder: (context, box, _) {
          final expenses = box.values.toList().cast<Expense>();
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
              '${Words.expensesOffThisMonth.tr()} \n${expensesOfThisMonth(expenses)}',
              textAlign: TextAlign.center,
              style: AppTextStyles.style600.copyWith(fontSize: 20),
            ),
          );
        });
  }
}
