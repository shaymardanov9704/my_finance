import 'package:hive/hive.dart';

part 'debt.g.dart';

@HiveType(typeId: 3)
class Debt extends HiveObject {
  @HiveField(0)
  final String borrowerName;

  @HiveField(1)
  final int amount;

  @HiveField(2)
  final bool isReturn;

  @HiveField(3)
  final DateTime createdDate;

  @HiveField(4)
  final DateTime returnDate;

  Debt({
    required this.borrowerName,
    required this.amount,
    required this.isReturn,
    required this.createdDate,
    required this.returnDate,
  });
}
