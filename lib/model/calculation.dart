import 'package:hive/hive.dart';

part 'calculation.g.dart';


@HiveType(typeId: 0)
class Calculation extends HiveObject{

  @HiveField(0)
  late String name;

  @HiveField(1)
  late DateTime createdDate;

  @HiveField(2)
  late bool isProfit = true;

  @HiveField(3)
  late double amount;

}

//profit loss