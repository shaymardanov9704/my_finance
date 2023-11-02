import 'package:flutter/cupertino.dart';
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
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          expense.name.toCamelCase(),
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          DateFormat(kDateFormatWithHour).format(expense.createdDate),
        ),
        trailing: Text(
          "${expense.amount} $kThousandSum",
          style: TextStyle(
            color: expense.refundable ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: _Icon(type: expense.type),
          ),
        ),
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

class _Icon extends StatelessWidget {
  final String type;

  const _Icon({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "food":
        return SvgPicture.asset(
          "assets/icons/food.svg",
          color: AppColors.white,
        );
      case "medicine":
        return SvgPicture.asset(
          "assets/icons/medicine.svg",
          color: AppColors.white,
        );
      case "sport":
        return SvgPicture.asset(
          "assets/icons/gym.svg",
          color: AppColors.white,
        );
      case "donation":
        return SvgPicture.asset(
          "assets/icons/donate.svg",
          color: AppColors.white,
        );
      case "other":
        return SvgPicture.asset(
          "assets/icons/other.svg",
          color: AppColors.white,
        );
      case "family":
        return SvgPicture.asset(
          "assets/icons/family.svg",
          color: AppColors.white,
        );
      case "travel":
        return SvgPicture.asset(
          "assets/icons/travel.svg",
          color: AppColors.white,
        );
      case "transport":
        return SvgPicture.asset(
          "assets/icons/bus.svg",
          color: AppColors.white,
        );
      case "shopping":
        return SvgPicture.asset(
          "assets/icons/shopping.svg",
          color: AppColors.white,
        );
      case "wife":
        return SvgPicture.asset(
          "assets/icons/wedding.svg",
          color: AppColors.white,
        );
      case "taxi":
        return SvgPicture.asset(
          "assets/icons/taxi.svg",
          color: AppColors.white,
        );
      case "education":
        return SvgPicture.asset(
          "assets/icons/education.svg",
            color: AppColors.white,
        );
    }
    return const SizedBox();
  }
}
