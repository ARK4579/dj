// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImportDj _$ImportDjFromJson(Map<String, dynamic> json) {
  return ImportDj(
    description: json['description'],
    importStr: json['importStr'] as String,
    isPackage: json['isPackage'] as bool,
    isFlutter: json['isFlutter'] as bool,
    isFile: json['isFile'] as bool,
    isPart: json['isPart'] as bool,
    codePartDjType:
        _$enumDecode(_$CodePartDjTypeEnumMap, json['codePartDjType']),
  );
}

Map<String, dynamic> _$ImportDjToJson(ImportDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull(
      'codePartDjType', _$CodePartDjTypeEnumMap[instance.codePartDjType]);
  val['importStr'] = instance.importStr;
  val['isPackage'] = instance.isPackage;
  val['isFlutter'] = instance.isFlutter;
  val['isFile'] = instance.isFile;
  val['isPart'] = instance.isPart;
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
