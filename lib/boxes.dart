import 'package:hive/hive.dart';
import 'package:my_finance/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');

  static Box<Transaction> getCalculations() =>
      Hive.box<Transaction>('calculation');
}
