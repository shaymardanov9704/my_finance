import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 2)
class Expense extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int amount;

  @HiveField(2)
  late bool refundable;

  @HiveField(3)
  late DateTime date;

  @HiveField(4)
  late String type;
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
