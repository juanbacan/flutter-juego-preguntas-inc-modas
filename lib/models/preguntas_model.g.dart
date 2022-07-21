// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preguntas_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreguntaAdapter extends TypeAdapter<Pregunta> {
  @override
  final int typeId = 0;

  @override
  Pregunta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pregunta()
      ..enunciado = fields[0] as String
      ..respuestas = (fields[1] as List).cast<String>()
      ..correcta = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, Pregunta obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.enunciado)
      ..writeByte(1)
      ..write(obj.respuestas)
      ..writeByte(2)
      ..write(obj.correcta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreguntaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
