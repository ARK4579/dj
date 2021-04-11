// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodePartDj _$CodePartDjFromJson(Map<String, dynamic> json) {
  return CodePartDj(
    description: json['description'] as String?,
    type: _$enumDecodeNullable(_$CodePartTypeEnumMap, json['type']),
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
  writeNotNull('type', _$CodePartTypeEnumMap[instance.type]);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$CodePartTypeEnumMap = {
  CodePartType.FunctionCall: 'FunctionCall',
  CodePartType.Function: 'Function',
  CodePartType.IfElse: 'IfElse',
  CodePartType.Import: 'Import',
};
