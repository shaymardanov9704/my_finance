import 'package:hive/hive.dart';
import 'package:my_finance/core/constants/constants.dart';
import 'package:my_finance/features/debts/data/models/debt.dart';

class DebtsBox {
  static Box<Debt> getDebts() => Hive.box<Debt>(kDebts);
}
