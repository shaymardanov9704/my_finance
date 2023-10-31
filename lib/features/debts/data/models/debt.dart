import 'package:hive/hive.dart';

part 'debt.g.dart';

@HiveType(typeId: 3)
class Debt extends HiveObject {
  @HiveField(0)
  late String borrowerName;

  @HiveField(1)
  late int amount;

  @HiveField(2)
  late bool isReturn;

  @HiveField(3)
  late DateTime createdDate;

  @HiveField(4)
  late DateTime returnDate;
}
