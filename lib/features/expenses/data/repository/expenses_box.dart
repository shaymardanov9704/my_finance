import 'package:hive/hive.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/features/expenses/data/models/expense.dart';

class ExpensesBox {
  static Box<Expense> getExpenses() => Hive.box<Expense>(kExpenses);
}
