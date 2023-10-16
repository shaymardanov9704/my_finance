import 'package:hive/hive.dart';
import 'package:my_finance/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');

  static Box<Transaction> getCalculation() =>
      Hive.box<Transaction>('calculation');
}
