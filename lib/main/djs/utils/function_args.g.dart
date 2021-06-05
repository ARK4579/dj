// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_args.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionArg _$FunctionArgFromJson(Map<String, dynamic> json) {
  return FunctionArg(
    type: _$enumDecodeNullable(_$VariableTypeEnumMap, json['type']),
    isRequired: json['isRequired'] as bool,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$FunctionArgToJson(FunctionArg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$VariableTypeEnumMap[instance.type]);
  val['isRequired'] = instance.isRequired;
  writeNotNull('name', instance.name);
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
};
