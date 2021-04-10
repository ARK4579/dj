// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDj _$FileDjFromJson(Map<String, dynamic> json) {
  return FileDj(
    fileExtension: json['fileExtension'] as String,
    codeParts: (json['codeParts'] as List<dynamic>?)
        ?.map((e) => CodePartDj.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FileDjToJson(FileDj instance) {
  final val = <String, dynamic>{
    'fileExtension': instance.fileExtension,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'codeParts', instance.codeParts?.map((e) => e.toJson()).toList());
  return val;
}
