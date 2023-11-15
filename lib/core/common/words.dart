// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';

extension MyWords on Words {
  String tr([dynamic key]) {
    final wordKey = "$name${key == null ? "" : "\$$key"}";
    return  wordKey.tr();
  }
}

enum Words {aboutApp, add, addDebt, addExpense, amount, appName, borrowerName, cancel, changeLan, close, darkMode, debts, debtsOffAllTime, debtsPage, delete, edit, editDebt, editExpense, emptyStatistics, english, enterName, expenses, expensesDiagram, expensesOffThisMonth, expensesPage, isReturn, noDebtsYet, noExpensesYet, numberError, refundable, returnDate, russian, save, share, som, statisticsPage, title, uzbek, uzbekCyr}