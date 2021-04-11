// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    conditionLeft: json['conditionLeft'] as String?,
    operator: _$enumDecodeNullable(_$OperatorEnumMap, json['operator']),
    conditionRight: json['conditionRight'] as String?,
    body: json['body'] == null
        ? null
        : CodePartDj.fromJson(json['body'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('conditionLeft', instance.conditionLeft);
  writeNotNull('operator', _$OperatorEnumMap[instance.operator]);
  writeNotNull('conditionRight', instance.conditionRight);
  writeNotNull('body', instance.body?.toJson());
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

const _$OperatorEnumMap = {
  Operator.Equal: 'Equal',
  Operator.NotEqual: 'NotEqual',
  Operator.Is: 'Is',
};
