// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldDj _$FieldDjFromJson(Map<String, dynamic> json) {
  return FieldDj(
    description: json['description'],
    name: json['name'] as String?,
    dataType: json['dataType'] as String?,
    safeDataType: json['safeDataType'] as String?,
    safetyDescription: (json['safetyDescription'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    isFinal: json['isFinal'] as bool?,
    isRequired: json['isRequired'] as bool?,
    isOptional: json['isOptional'] as bool?,
    superOnly: json['superOnly'] as bool?,
    isStatic: json['isStatic'] as bool?,
    defaultValue: json['defaultValue'],
    codePartDjType:
        _$enumDecode(_$CodePartDjTypeEnumMap, json['codePartDjType']),
  );
}

Map<String, dynamic> _$FieldDjToJson(FieldDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull(
      'codePartDjType', _$CodePartDjTypeEnumMap[instance.codePartDjType]);
  writeNotNull('name', instance.name);
  writeNotNull('dataType', instance.dataType);
  writeNotNull('safeDataType', instance.safeDataType);
  writeNotNull('safetyDescription', instance.safetyDescription);
  writeNotNull('isFinal', instance.isFinal);
  writeNotNull('isRequired', instance.isRequired);
  writeNotNull('isOptional', instance.isOptional);
  writeNotNull('isStatic', instance.isStatic);
  writeNotNull('superOnly', instance.superOnly);
  writeNotNull('defaultValue', instance.defaultValue);
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

const _$CodePartDjTypeEnumMap = {
  CodePartDjType.FunctionCall: 'FunctionCall',
  CodePartDjType.Function: 'Function',
  CodePartDjType.IfElse: 'IfElse',
  CodePartDjType.Import: 'Import',
  CodePartDjType.StatelessWidget: 'StatelessWidget',
  CodePartDjType.Return: 'Return',
  CodePartDjType.Class: 'Class',
  CodePartDjType.Field: 'Field',
  CodePartDjType.Enum: 'Enum',
  CodePartDjType.Map: 'Map',
};
