import 'package:hive/hive.dart';
import 'package:my_finance/pages/expenses/data/models/expense.dart';

class ExpensesBox {
  static Box<Expense> getExpenses() => Hive.box<Expense>('expenses');
}
