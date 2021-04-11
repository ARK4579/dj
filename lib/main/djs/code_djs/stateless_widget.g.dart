// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stateless_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatelessWidgetDj _$StatelessWidgetDjFromJson(Map<String, dynamic> json) {
  return StatelessWidgetDj(
    description: json['description'],
    name: json['name'] as String?,
    args: (json['args'] as List<dynamic>?)
        ?.map((e) => FunctionArg.fromJson(e as Map<String, dynamic>))
        .toList(),
    body: (json['body'] as List<dynamic>?)
        ?.map((e) => CodePartDj.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: _$enumDecode(_$CodePartTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$StatelessWidgetDjToJson(StatelessWidgetDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('type', _$CodePartTypeEnumMap[instance.type]);
  writeNotNull('name', instance.name);
  writeNotNull('args', instance.args?.map((e) => e.toJson()).toList());
  writeNotNull('body', instance.body?.map((e) => e.toJson()).toList());
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
};
