// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryDj _$DirectoryDjFromJson(Map<String, dynamic> json) {
  return DirectoryDj(
    nodes: (json['nodes'] as List<dynamic>?)
        ?.map((e) => NodeDj.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DirectoryDjToJson(DirectoryDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nodes', instance.nodes?.map((e) => e.toJson()).toList());
  return val;
}
