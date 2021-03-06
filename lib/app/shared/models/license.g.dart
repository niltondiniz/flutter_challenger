// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LicenseAdapter extends TypeAdapter<License> {
  @override
  final int typeId = 3;

  @override
  License read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return License(
      key: fields[0] as String,
      name: fields[2] as String,
      spdxId: fields[3] as String,
      url: fields[4] as String,
      nodeId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, License obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.spdxId)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.nodeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LicenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
