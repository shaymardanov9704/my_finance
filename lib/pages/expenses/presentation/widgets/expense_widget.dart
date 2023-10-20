import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/core/extentions/string_extension.dart';
import 'package:my_finance/pages/expenses/data/models/expense.dart';
import 'package:my_finance/pages/expenses/presentation/dialogs/expense_dialog.dart';

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
    expense.name = name;
    expense.amount = amount;
    expense.refundable = refundable;
    expense.type = type;
    expense.save();
  }

  void deleteExpense(Expense expense) => expense.delete();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Text(
            expense.name.toCamelCase(),
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(DateFormat.yMMMd().format(expense.date)),
          trailing: Text(
            '\$${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: expense.refundable ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          leading: _Icon(type: expense.type),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    label: const Text('Edit'),
                    icon: const Icon(Icons.edit),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ExpenseDialog(
                        expense: expense,
                        onClickedDone: (name, amount, isExpense, type) =>
                            editExpense(
                          expense,
                          name,
                          amount,
                          type,
                          isExpense,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    label: const Text('Delete'),
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteExpense(expense),
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

class _Icon extends StatelessWidget {
  final String type;

  const _Icon({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "food":
        return const Icon(CupertinoIcons.ear);
      case "medicine":
        return const Icon(CupertinoIcons.moon);
      case "sport":
        return const Icon(CupertinoIcons.sportscourt);
      case "donation":
        return const Icon(CupertinoIcons.doc);
      case "other":
        return const Icon(CupertinoIcons.shield);
      case "family":
        return const Icon(CupertinoIcons.person);
      case "travel":
        return const Icon(CupertinoIcons.train_style_one);
      case "transport":
        return const Icon(CupertinoIcons.train_style_two);
      case "shopping":
        return const Icon(CupertinoIcons.shopping_cart);
    }
    return const Placeholder();
  }
}
