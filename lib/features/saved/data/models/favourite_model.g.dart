// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteModelAdapter extends TypeAdapter<FavouriteModel> {
  @override
  final int typeId = 1;

  @override
  FavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteModel(
      name: fields[0] as String,
      image: fields[1] as String,
      governorate: fields[2] as String,
      area: fields[3] as String,
      address: fields[4] as String,
      visitingHours: fields[5] as String,
      ticketPrice: fields[6] as String,
      description: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.governorate)
      ..writeByte(3)
      ..write(obj.area)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.visitingHours)
      ..writeByte(6)
      ..write(obj.ticketPrice)
      ..writeByte(7)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
