// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodePartDj _$CodePartDjFromJson(Map<String, dynamic> json) {
  return CodePartDj(
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$CodePartDjToJson(CodePartDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
