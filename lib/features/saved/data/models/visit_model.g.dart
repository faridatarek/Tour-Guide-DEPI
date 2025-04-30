// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitModelAdapter extends TypeAdapter<VisitModel> {
  @override
  final int typeId = 0;

  @override
  VisitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitModel(
      name: fields[0] as String,
      image: fields[1] as String,
      visitDate: fields[2] as DateTime,
      governorate: fields[3] as String,
      area: fields[4] as String,
      address: fields[5] as String,
      visitingHours: fields[6] as String,
      ticketPrice: fields[7] as String,
      description: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VisitModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.visitDate)
      ..writeByte(3)
      ..write(obj.governorate)
      ..writeByte(4)
      ..write(obj.area)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.visitingHours)
      ..writeByte(7)
      ..write(obj.ticketPrice)
      ..writeByte(8)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
