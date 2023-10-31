import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 2)
class Expense extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int amount;

  @HiveField(2)
  final bool refundable;

  @HiveField(3)
  final DateTime createdDate;

  @HiveField(4)
  final String type;

  Expense(
      {required this.name,
      required this.amount,
      required this.refundable,
      required this.createdDate,
      required this.type});
}


