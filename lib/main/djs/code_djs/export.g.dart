// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExportDj _$ExportDjFromJson(Map<String, dynamic> json) {
  return ExportDj(
    descriptionDj: json['descriptionDj'],
    exportStr: json['exportStr'] as String?,
    codePartDjType:
        _$enumDecode(_$CodePartDjTypeEnumMap, json['codePartDjType']),
  );
}

Map<String, dynamic> _$ExportDjToJson(ExportDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descriptionDj', instance.descriptionDj);
  val['codePartDjType'] = _$CodePartDjTypeEnumMap[instance.codePartDjType];
  writeNotNull('exportStr', instance.exportStr);
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
};
