import 'package:hive/hive.dart';

part 'calculation.g.dart';

@HiveType(typeId: 1)
class Calculation extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late DateTime createdDate;

  @HiveField(2)
  late bool isProfit = true;

  @HiveField(3)
  late double amount;

  @HiveField(4)
  late ExpenseType expenseType;
}

enum ExpenseType {
  sport,
  medicine,
  transport,
  food,
  shopping,
  travel,
  donation,
  other,
  family
}
//profit loss
