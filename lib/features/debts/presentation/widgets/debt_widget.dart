import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/presentation/dialogs/debt_dialog.dart';

class DebtWidget extends StatelessWidget {
  final Debt debt;

  const DebtWidget({Key? key, required this.debt}) : super(key: key);

  void editTransaction(
    Debt debt,
    String name,
    int amount,
    bool isExpense,
  ) {
    debt.borrowerName = name;
    debt.amount = amount;
    debt.isReturn = isExpense;
    debt.save();
  }

  void deleteTransaction(Debt transaction) {
    debt.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          debt.borrowerName,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(DateFormat.yMMMd().format(debt.createdDate)),
        trailing: Text(
          '\$${debt.amount.toStringAsFixed(2)}',
          style: TextStyle(
              color: debt.isReturn ? Colors.red : Colors.green, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  label: const Text('Edit'),
                  icon: const Icon(Icons.edit),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DebtDialog(
                        debt: debt,
                        onClickedDone: (name, amount, isExpense,ret) =>
                            editTransaction(
                                debt, name, amount, isExpense),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  label: const Text('Delete'),
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTransaction(debt),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
