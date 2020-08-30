// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brewery.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreweryAdapter extends TypeAdapter<Brewery> {
  @override
  final int typeId = 0;

  @override
  Brewery read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brewery(
      id: fields[0] as int,
      name: fields[1] as String,
      brewery_type: fields[2] as String,
      street: fields[3] as String,
      city: fields[4] as String,
      state: fields[5] as String,
      postal_code: fields[6] as String,
      longitude: fields[7] as String,
      latitude: fields[9] as String,
      phone: fields[10] as String,
      website_url: fields[11] as String,
      updated_at: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Brewery obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.brewery_type)
      ..writeByte(3)
      ..write(obj.street)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.postal_code)
      ..writeByte(7)
      ..write(obj.longitude)
      ..writeByte(9)
      ..write(obj.latitude)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.website_url)
      ..writeByte(12)
      ..write(obj.updated_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreweryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
