// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDj _$BaseDjFromJson(Map<String, dynamic> json) {
  return BaseDj(
    path: json['path'] as String,
    node: DirectoryDj.fromJson(json['node'] as Map<String, dynamic>),
    overwite: json['overwite'] as bool,
  );
}

Map<String, dynamic> _$BaseDjToJson(BaseDj instance) => <String, dynamic>{
      'path': instance.path,
      'node': instance.node.toJson(),
      'overwite': instance.overwite,
    };
