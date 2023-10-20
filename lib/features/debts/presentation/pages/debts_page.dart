import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/debts/data/repository/debts_box.dart';
import 'package:my_finance/features/debts/presentation/dialogs/debt_dialog.dart';
import 'package:my_finance/features/debts/presentation/widgets/debt_widget.dart';

class DebtsPage extends StatefulWidget {
  const DebtsPage({super.key});

  @override
  State<DebtsPage> createState() => _DebtsPageState();
}

class _DebtsPageState extends State<DebtsPage> {

  Future addTransaction(String name, int amount, bool isExpense) async {
    final debt = Debt()
      ..borrowerName = name
      ..date = DateTime.now()
      ..amount = amount
      ..isReturn = isExpense;

    final box = DebtsBox.getDebts();
    box.add(debt);
  }
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
        body: ValueListenableBuilder<Box<Debt>>(
          valueListenable: DebtsBox.getDebts().listenable(),
          builder: (context, box, _) {
            final debts = box.values.toList().cast<Debt>();
            if (debts.isEmpty) {
              return const Center(
                child: Text(
                  'No expenses yet!',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              final netExpense = debts.fold<double>(
                0,
                (previousValue, transaction) => transaction.isReturn
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
                      itemCount: debts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DebtWidget(debt: debts[index],);
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







}
