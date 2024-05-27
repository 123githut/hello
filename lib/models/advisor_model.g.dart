// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advisor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvisorsAdapter extends TypeAdapter<Advisors> {
  @override
  final int typeId = 0;

  @override
  Advisors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Advisors(
      advisorId: fields[0] as String?,
      advisorName: fields[1] as String?,
      advisorAvatar: fields[2] as String?,
      advisorDesc: fields[3] as String?,
      services: (fields[4] as List?)?.cast<Services>(),
    );
  }

  @override
  void write(BinaryWriter writer, Advisors obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.advisorId)
      ..writeByte(1)
      ..write(obj.advisorName)
      ..writeByte(2)
      ..write(obj.advisorAvatar)
      ..writeByte(3)
      ..write(obj.advisorDesc)
      ..writeByte(4)
      ..write(obj.services);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvisorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ServicesAdapter extends TypeAdapter<Services> {
  @override
  final int typeId = 1;

  @override
  Services read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Services(
      serviceName: fields[0] as String?,
      serviceDesc: fields[1] as String?,
      servicePrice: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Services obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.serviceName)
      ..writeByte(1)
      ..write(obj.serviceDesc)
      ..writeByte(2)
      ..write(obj.servicePrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServicesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
