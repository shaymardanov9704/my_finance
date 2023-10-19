import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/model/calculation.dart';
import 'package:my_finance/model/debt.dart';
import 'package:my_finance/model/transaction.dart';
import 'package:my_finance/pages/expenses/data/models/expense.dart';
import 'package:my_finance/pages/skeleton.dart';
import 'package:my_finance/pages/expenses/presentation/pages/expenses_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();


  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  Hive.registerAdapter(CalculationAdapter());
  await Hive.openBox<Calculation>('calculation');

  Hive.registerAdapter(ExpenseAdapter());
  await Hive.openBox<Expense>('expenses');

  Hive.registerAdapter(DebtAdapter());
  await Hive.openBox<Debt>('debts');

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Skeleton(),
    );
  }
}