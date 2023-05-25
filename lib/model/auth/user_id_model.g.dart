// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserIdAdapter extends TypeAdapter<UserId> {
  @override
  final int typeId = 3;

  @override
  UserId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserId(
      uid: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserId obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
