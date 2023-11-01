import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/presentation/dialogs/debt_dialog.dart';

class DebtWidget extends StatelessWidget {
  final Debt debt;

  const DebtWidget({Key? key, required this.debt}) : super(key: key);

  void deleteDebt(Debt debt) {
    debt.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Text(
            debt.borrowerName,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(DateFormat.yMMMd().format(debt.returnDate)),
          trailing: Text(
            debt.amount.toStringAsFixed(3),
            style: TextStyle(
              color: debt.isReturn ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    label: const Text('Edit'),
                    icon: const Icon(Icons.edit),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => DebtDialog(debt: debt),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    label: const Text('Delete'),
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteDebt(debt),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
