import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';
import 'package:my_finance/boxes.dart';
import 'package:my_finance/model/transaction.dart';
import 'package:my_finance/pages/debts/data/models/debt.dart';
import 'package:my_finance/pages/debts/data/repository/debts_box.dart';
import 'package:my_finance/pages/debts/presentation/dialogs/debt_dialog.dart';
import 'package:my_finance/widgets/transaction_dialog.dart';

class DebtsPage extends StatefulWidget {
  const DebtsPage({super.key});

  @override
  State<DebtsPage> createState() => _DebtsPageState();
}

class _DebtsPageState extends State<DebtsPage> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Debts Page '),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<Transaction>>(
          valueListenable: Boxes.getTransactions().listenable(),
          builder: (context, box, _) {
            final transactions = box.values.toList().cast<Transaction>();
            if (transactions.isEmpty) {
              return const Center(
                child: Text(
                  'No expenses yet!',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              final netExpense = transactions.fold<double>(
                0,
                (previousValue, transaction) => transaction.isExpense
                    ? previousValue - transaction.amount
                    : previousValue + transaction.amount,
              );
              final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
              final color = netExpense > 0 ? Colors.green : Colors.red;

              return Column(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Net Expense: $newExpenseString',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final transaction = transactions[index];

                        return buildTransaction(context, transaction);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => DebtDialog(
              onClickedDone: addTransaction,
            ),
          ),
        ),
      );

  Widget buildTransaction(
    BuildContext context,
    Transaction transaction,
  ) {
      final color = transaction.isExpense ? Colors.red : Colors.green;
      final date = DateFormat.yMMMd().format(transaction.createdDate);
      final amount = '\$' + transaction.amount.toStringAsFixed(2);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.name,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          buildButtons(context, transaction),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, Transaction transaction) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: const Text('Edit'),
              icon: const Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionDialog(
                    transaction: transaction,
                    onClickedDone: (name, amount, isExpense) =>
                        editTransaction(transaction, name, amount, isExpense),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: const Text('Delete'),
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTransaction(transaction),
            ),
          )
        ],
      );

  Future addTransaction(String name, int amount, bool isExpense) async {
    final debt = Debt()
      ..borrowerName = name
      ..date = DateTime.now()
      ..amount = amount
      ..isReturn = isExpense;

    final box = DebtsBox.getDebts();
    box.add(debt);
  }

  void editTransaction(
    Transaction transaction,
    String name,
    double amount,
    bool isExpense,
  ) {
    transaction.name = name;
    transaction.amount = amount;
    transaction.isExpense = isExpense;
    transaction.save();
  }

  void deleteTransaction(Transaction transaction) {
    transaction.delete();
  }
}
