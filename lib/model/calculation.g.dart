// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationAdapter extends TypeAdapter<Calculation> {
  @override
  final int typeId = 1;

  @override
  Calculation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Calculation()
      ..name = fields[0] as String
      ..createdDate = fields[1] as DateTime
      ..isProfit = fields[2] as bool
      ..amount = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, Calculation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.isProfit)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
