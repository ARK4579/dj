// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionDj _$FunctionDjFromJson(Map<String, dynamic> json) {
  return FunctionDj(
    descriptionDj: json['descriptionDj'],
    outputType: _$enumDecodeNullable(_$VariableTypeEnumMap, json['outputType']),
    name: json['name'] as String,
    args: (json['args'] as List<dynamic>?)
        ?.map((e) => FunctionArg.fromJson(e as Map<String, dynamic>))
        .toList(),
    isAsync: json['isAsync'] as bool,
    bodyCodeParts: (json['bodyCodeParts'] as List<dynamic>?)
        ?.map((e) => CodePartDj.fromJson(e as Map<String, dynamic>))
        .toList(),
    annotations: (json['annotations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    codePartDjType:
        _$enumDecode(_$CodePartDjTypeEnumMap, json['codePartDjType']),
  );
}

Map<String, dynamic> _$FunctionDjToJson(FunctionDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descriptionDj', instance.descriptionDj);
  writeNotNull(
      'codePartDjType', _$CodePartDjTypeEnumMap[instance.codePartDjType]);
  writeNotNull('outputType', _$VariableTypeEnumMap[instance.outputType]);
  val['name'] = instance.name;
  writeNotNull('args', instance.args?.map((e) => e.toJson()).toList());
  val['isAsync'] = instance.isAsync;
  writeNotNull(
      'bodyCodeParts', instance.bodyCodeParts?.map((e) => e.toJson()).toList());
  writeNotNull('annotations', instance.annotations);
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
};
