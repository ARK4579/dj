// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassDj _$ClassDjFromJson(Map<String, dynamic> json) {
  return ClassDj(
    description: json['description'],
    name: json['name'] as String?,
    baseName: json['baseName'] as String?,
    fields: (json['fields'] as List<dynamic>?)
        ?.map((e) => FieldDj.fromJson(e as Map<String, dynamic>))
        .toList(),
    isExtends: json['isExtends'] as bool?,
    isImplements: json['isImplements'] as bool?,
    jsonSerializable: json['jsonSerializable'] as bool?,
    type: _$enumDecode(_$CodePartTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ClassDjToJson(ClassDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('type', _$CodePartTypeEnumMap[instance.type]);
  writeNotNull('name', instance.name);
  writeNotNull('baseName', instance.baseName);
  writeNotNull('fields', instance.fields?.map((e) => e.toJson()).toList());
  writeNotNull('isExtends', instance.isExtends);
  writeNotNull('isImplements', instance.isImplements);
  writeNotNull('jsonSerializable', instance.jsonSerializable);
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
};
