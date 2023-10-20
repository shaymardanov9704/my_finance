import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';
import 'package:my_finance/features/expenses/data/repository/expenses_box.dart';
import 'package:my_finance/features/expenses/presentation/dialogs/expense_dialog.dart';
import 'package:my_finance/features/expenses/presentation/widgets/expense_widget.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  Future<void> addTransaction(
    String name,
    int amount,
    bool isExpense,
    String type,
  ) async {
    final expense = Expense()
      ..name = name
      ..date = DateTime.now()
      ..amount = amount
      ..type = type.toString()
      ..refundable = isExpense;

    final box = ExpensesBox.getExpenses();
    box.add(expense);
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Page'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<Expense>>(
          valueListenable: ExpensesBox.getExpenses().listenable(),
          builder: (context, box, _) {
            final expenses = box.values.toList().cast<Expense>();
            if (expenses.isEmpty) {
              return const Center(
                child: Text(
                  'No expenses yet!',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else if (expenses.isNotEmpty) {
              final netExpense = expenses.fold<int>(
                0,
                (previousValue, expense) =>  previousValue + expense.amount,
              );
              final newExpenseString = '$netExpense ming UZS';
              return Column(
                children: [
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.black,
                            Colors.blue,
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.red,
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ]),
                    child: Text(
                      'Umumiy xarajatlar: \n$newExpenseString',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => ExpenseDialog(
              onClickedDone: addTransaction,
            ),
          ),
        ),
      );
}
