import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/core/utils/app_colors.dart';
import 'package:my_finance/core/utils/app_text_styles.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/presentation/dialogs/debt_dialog.dart';
import 'package:my_finance/core/generated/locale_keys.g.dart';

class DebtWidget extends StatelessWidget {
  final Debt debt;

  const DebtWidget({Key? key, required this.debt}) : super(key: key);

  void deleteDebt(Debt debt) {
    debt.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        title: Text(
          debt.borrowerName,
          maxLines: 2,
          style: AppTextStyles.style700.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          "${LocaleKeys.returnDate.tr()}: ${DateFormat(kDateFormat).format(debt.returnDate)}",
          style: AppTextStyles.style500.copyWith(
            color: DateTime.now().isBefore(debt.returnDate) || debt.isReturn
                ? AppColors.green
                : AppColors.red,
          ),
        ),
        trailing: Text(
          "${debt.amount} ${LocaleKeys.som.tr()}",
          style: AppTextStyles.style700.copyWith(
            color: debt.isReturn ? Colors.green : Colors.red,
            fontSize: 16,
          ),
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  label: Text(LocaleKeys.edit.tr()),
                  style: TextButton.styleFrom(
                      textStyle:
                          AppTextStyles.style700.copyWith(color: Colors.white)),
                  icon: const Icon(Icons.edit),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => DebtDialog(debt: debt),
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  label: Text(LocaleKeys.delete.tr()),
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteDebt(debt),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
