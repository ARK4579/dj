// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'if_else.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IfElseDj _$IfElseDjFromJson(Map<String, dynamic> json) {
  return IfElseDj(
    description: json['description'],
    conditions: (json['conditions'] as List<dynamic>?)
        ?.map((e) => Condition.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$IfElseDjToJson(IfElseDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull(
      'conditions', instance.conditions?.map((e) => e.toJson()).toList());
  return val;
}
