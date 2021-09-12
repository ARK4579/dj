// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_declaration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariableDeclarationDj _$VariableDeclarationDjFromJson(
    Map<String, dynamic> json) {
  return VariableDeclarationDj(
    descriptionDj: json['descriptionDj'],
    dataType: _$enumDecodeNullable(_$VariableTypeEnumMap, json['dataType']),
    name: json['name'] as String?,
    initialValue: json['initialValue'] as String?,
    codePartDjType:
        _$enumDecode(_$CodePartDjTypeEnumMap, json['codePartDjType']),
  );
}

Map<String, dynamic> _$VariableDeclarationDjToJson(
    VariableDeclarationDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descriptionDj', instance.descriptionDj);
  val['codePartDjType'] = _$CodePartDjTypeEnumMap[instance.codePartDjType];
  writeNotNull('dataType', _$VariableTypeEnumMap[instance.dataType]);
  writeNotNull('name', instance.name);
  writeNotNull('initialValue', instance.initialValue);
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

const _$VariableTypeEnumMap = {
  VariableType.Void: 'Void',
  VariableType.String: 'String',
  VariableType.StringNullable: 'StringNullable',
  VariableType.ListString: 'ListString',
  VariableType.ListStringNullable: 'ListStringNullable',
  VariableType.Var: 'Var',
  VariableType.Dynamic: 'Dynamic',
};

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
