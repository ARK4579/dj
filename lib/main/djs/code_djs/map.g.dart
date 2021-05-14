// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapDj _$MapDjFromJson(Map<String, dynamic> json) {
  return MapDj(
    description: json['description'],
    name: json['name'] as String?,
    keyDataType: json['keyDataType'] as String?,
    valueDataType: json['valueDataType'] as String?,
    values: (json['values'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecode(_$CodePartTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$MapDjToJson(MapDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('type', _$CodePartTypeEnumMap[instance.type]);
  writeNotNull('name', instance.name);
  writeNotNull('keyDataType', instance.keyDataType);
  writeNotNull('valueDataType', instance.valueDataType);
  writeNotNull('values', instance.values);
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

const _$CodePartTypeEnumMap = {
  CodePartType.FunctionCall: 'FunctionCall',
  CodePartType.Function: 'Function',
  CodePartType.IfElse: 'IfElse',
  CodePartType.Import: 'Import',
  CodePartType.StatelessWidget: 'StatelessWidget',
  CodePartType.Return: 'Return',
  CodePartType.Class: 'Class',
  CodePartType.Field: 'Field',
  CodePartType.Enum: 'Enum',
  CodePartType.Map: 'Map',
};
