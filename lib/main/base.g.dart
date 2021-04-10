// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDj _$BaseDjFromJson(Map<String, dynamic> json) {
  return BaseDj(
    baseDirectoryPath: json['baseDirectoryPath'] as String,
    baseNode: DirectoryDj.fromJson(json['baseNode'] as Map<String, dynamic>),
    overwite: json['overwite'] as bool,
  );
}

Map<String, dynamic> _$BaseDjToJson(BaseDj instance) => <String, dynamic>{
      'baseDirectoryPath': instance.baseDirectoryPath,
      'baseNode': instance.baseNode.toJson(),
      'overwite': instance.overwite,
    };
