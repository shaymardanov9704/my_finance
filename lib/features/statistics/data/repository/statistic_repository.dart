import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';

class StatisticRepository {
  static Box<Expense> getExpenses() => Hive.box<Expense>(kExpenses);

  static Box<Debt> getDebts() => Hive.box<Debt>(kDebts);
}
