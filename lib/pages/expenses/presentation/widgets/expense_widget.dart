import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_finance/pages/expenses/data/models/expense.dart';
import 'package:my_finance/pages/expenses/presentation/dialogs/expense_dialog.dart';

class ExpenseWidget extends StatelessWidget {
  final Expense expense;

  const ExpenseWidget({Key? key, required this.expense}) : super(key: key);

  void editExpense(
    Expense expense,
    String name,
    int amount,
    ExpenseType type,
    bool refundable,
  ) {
    expense.name = name;
    expense.amount = amount;
    expense.refundable = refundable;
    expense.save();
  }

  void deleteExpense(Expense expense) => expense.delete();

  @override
  Widget build(BuildContext context) {
    final color = expense.refundable ? Colors.red : Colors.green;
    final date = DateFormat.yMMMd().format(expense.date);
    final amount = '\$${expense.amount.toStringAsFixed(2)}';
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          expense.name,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
            color: color,
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
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
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
    );
  }
}
