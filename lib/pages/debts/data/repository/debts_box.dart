import 'package:hive/hive.dart';
import 'package:my_finance/pages/debts/data/models/debt.dart';

class DebtsBox {
  static Box<Debt> getDebts() => Hive.box<Debt>('debts');
}
