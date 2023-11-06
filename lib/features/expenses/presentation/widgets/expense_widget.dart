import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/extentions/string_extension.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/expenses/data/repository/expenses_box.dart';
import 'package:my_finance/features/expenses/presentation/dialogs/expense_dialog.dart';
import 'package:my_finance/features/skeleton/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ExpenseWidget extends StatelessWidget {
  final Expense expense;

  const ExpenseWidget({Key? key, required this.expense}) : super(key: key);

  editExpense(
    Expense expense,
    String name,
    int amount,
    String type,
    bool refundable,
  ) {
    final editedExpense = Expense(
      name: name,
      amount: amount,
      refundable: refundable,
      createdDate: expense.createdDate,
      type: type,
    );
    expense.delete();
    final box = ExpensesBox.getExpenses();
    box.add(editedExpense);
  }

  void deleteExpense(Expense expense) => expense.delete();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12),
        title: Text(
          expense.name.toCamelCase(),
          maxLines: 2,
          style: AppTextStyles.style600.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          DateFormat(kDateFormatWithHour).format(expense.createdDate),
        ),
        trailing: Text(
          "${expense.amount} $kThousandSum",
          style: AppTextStyles.style700.copyWith(
            color: expense.refundable ? Colors.green : Colors.red,
            fontSize: 16,
          ),
        ),
        leading: LeadingWidget(type: expense.type),
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  label: Text(
                    kEdit,
                    style:
                        AppTextStyles.style600.copyWith(color: AppColors.green),
                  ),
                  icon: Icon(Icons.edit, color: AppColors.green),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => ExpenseDialog(expense: expense),
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  label: Text(
                    kDelete,
                    style:
                        AppTextStyles.style600.copyWith(color: AppColors.green),
                  ),
                  icon: Icon(Icons.delete, color: AppColors.green),
                  onPressed: () => deleteExpense(expense),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LeadingWidget extends StatelessWidget {
  final String type;

  const LeadingWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _color(type),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: SvgPicture.asset(
          "assets/icons/$type.svg",
          color: context.watch<ThemeProvider>().isDark
              ? AppColors.white
              : AppColors.black,
        ),
      ),
    );
  }
}

Color _color(String type) {
  switch (type) {
    case "travel" || "shopping":
      return AppColors.orange.withOpacity(0.4);
    case "sport" || "food" || "education":
      return AppColors.green.withOpacity(0.4);
    case "medicine" || "family" || "donation":
      return AppColors.blue.withOpacity(0.4);
    case "transport" || "taxi":
      return AppColors.yellow.withOpacity(0.4);
    case "other":
      return AppColors.red.withOpacity(0.4);
    case "wife":
      return AppColors.purple.withOpacity(0.4);
  }
  return AppColors.black.withOpacity(0.4);
}
