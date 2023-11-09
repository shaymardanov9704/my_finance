import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/expenses/data/repository/expenses_box.dart';
import 'package:my_finance/features/expenses/presentation/dialogs/expense_dialog.dart';
import 'package:my_finance/features/expenses/presentation/widgets/expense_widget.dart';
import 'package:my_finance/features/expenses/presentation/widgets/top_widget.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:my_finance/features/skeleton/widgets/custom_empty_screen.dart';
import 'package:my_finance/features/skeleton/widgets/custom_theme_switch_button.dart';
import 'package:provider/provider.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ValueListenableBuilder<Box<Expense>>(
          valueListenable: ExpensesBox.getExpenses().listenable(),
          builder: (context, box, _) {
            final expenses = box.values.toList().cast<Expense>();
            if (expenses.isEmpty) {
              return const Center(
                child: CustomEmptyScreen(
                  title: kNotExpenses,
                  iconPath: "assets/icons/empty_wallet.svg",
                ),
              );
            } else if (expenses.isNotEmpty) {
              return Column(
                children: [
                  const SizedBox(height: 24),
                  ExpensesInfoWidget(),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: expenses.length,
                      itemBuilder: (_, index) {
                        return ExpenseWidget(expense: expenses[index]);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const CupertinoActivityIndicator();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const ExpenseDialog(),
          ),
          child: Icon(
            Icons.add,
            color: context.watch<ThemeProvider>().isDark
                ? AppColors.green
                : AppColors.primary,
          ),
        ),
      );
}
