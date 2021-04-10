// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDj _$FileDjFromJson(Map<String, dynamic> json) {
  return FileDj(
    name: json['name'],
    fileExtension: json['fileExtension'],
    codeParts: (json['codeParts'] as List<dynamic>?)
        ?.map((e) => CodePartDj.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: _$enumDecode(_$StructureTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$FileDjToJson(FileDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['type'] = _$StructureTypeEnumMap[instance.type];
  writeNotNull('fileExtension', instance.fileExtension);
  writeNotNull(
      'codeParts', instance.codeParts?.map((e) => e.toJson()).toList());
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

const _$StructureTypeEnumMap = {
  StructureType.File: 'File',
  StructureType.Directory: 'Directory',
};
