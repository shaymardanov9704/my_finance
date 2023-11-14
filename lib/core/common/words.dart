// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    final wordKey = "$name${key == null ? "" : "\$$key"}";
    return wordKey.tr();
  }
}

enum Words {add, addDebt, addExpense, amount, appName, borrowerName, cancel, debts, debtsOffAllTime, debtsPage, delete, edit, editDebt, editExpense, enterName, expenses, expensesDiagram, expensesOffThisMonth, expensesPage, isReturn, noDebtsYet, noExpensesYet, numberError, refundable, returnDate, save, som, statisticsPage, title}