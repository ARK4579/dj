// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeDj _$NodeDjFromJson(Map<String, dynamic> json) {
  return NodeDj(
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$NodeDjToJson(NodeDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}
