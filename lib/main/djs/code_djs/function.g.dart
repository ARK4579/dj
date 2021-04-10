// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionDj _$FunctionDjFromJson(Map<String, dynamic> json) {
  return FunctionDj(
    description: json['description'],
    outputType: _$enumDecode(_$VariableTypeEnumMap, json['outputStr']),
    name: json['name'] as String,
    args: (json['args'] as List<dynamic>?)
        ?.map((e) => FunctionArg.fromJson(e as Map<String, dynamic>))
        .toList(),
    isAsync: json['isAsync'] as bool,
    bodyCodeParts: (json['bodyCodeParts'] as List<dynamic>?)
        ?.map((e) => CodePartDj.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FunctionDjToJson(FunctionDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['outputStr'] = _$VariableTypeEnumMap[instance.outputType];
  val['name'] = instance.name;
  writeNotNull('args', instance.args?.map((e) => e.toJson()).toList());
  val['isAsync'] = instance.isAsync;
  writeNotNull(
      'bodyCodeParts', instance.bodyCodeParts?.map((e) => e.toJson()).toList());
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

const _$VariableTypeEnumMap = {
  VariableType.Void: 'Void',
  VariableType.String: 'String',
  VariableType.StringNullable: 'StringNullable',
};
