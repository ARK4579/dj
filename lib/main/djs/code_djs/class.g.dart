// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassDj _$ClassDjFromJson(Map<String, dynamic> json) {
  return ClassDj(
    descriptionDj: json['descriptionDj'],
    name: json['name'] as String?,
    baseName: json['baseName'] as String?,
    fields: (json['fields'] as List<dynamic>?)
        ?.map((e) => FieldDj.fromJson(e as Map<String, dynamic>))
        .toList(),
    isExtends: json['isExtends'] as bool?,
    isImplements: json['isImplements'] as bool?,
    jsonSerializable: json['jsonSerializable'] as bool,
    functions: (json['functions'] as List<dynamic>?)
        ?.map((e) => CodePartDj.fromJson(e as Map<String, dynamic>))
        .toList(),
    selfJsonSerialization: json['selfJsonSerialization'] as bool,
    codePartDjType:
        _$enumDecode(_$CodePartDjTypeEnumMap, json['codePartDjType']),
  );
}

Map<String, dynamic> _$ClassDjToJson(ClassDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descriptionDj', instance.descriptionDj);
  val['codePartDjType'] = _$CodePartDjTypeEnumMap[instance.codePartDjType];
  writeNotNull('name', instance.name);
  writeNotNull('baseName', instance.baseName);
  writeNotNull('fields', instance.fields?.map((e) => e.toJson()).toList());
  writeNotNull('isExtends', instance.isExtends);
  writeNotNull('isImplements', instance.isImplements);
  val['jsonSerializable'] = instance.jsonSerializable;
  writeNotNull(
      'functions', instance.functions?.map((e) => e.toJson()).toList());
  val['selfJsonSerialization'] = instance.selfJsonSerialization;
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
  CodePartDjType.EmptyLine: 'EmptyLine',
  CodePartDjType.VariableDeclaration: 'VariableDeclaration',
  CodePartDjType.SingleLine: 'SingleLine',
  CodePartDjType.Export: 'Export',
  CodePartDjType.BaseWidget: 'BaseWidget',
  CodePartDjType.DataType: 'DataType',
  CodePartDjType.CustomType: 'CustomType',
};
