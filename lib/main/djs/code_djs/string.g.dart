// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringDj _$StringDjFromJson(Map<String, dynamic> json) {
  return StringDj(
    descriptionDj: json['descriptionDj'],
    value: json['value'] as String?,
    baseWidgetDjType: json['baseWidgetDjType'],
  );
}

Map<String, dynamic> _$StringDjToJson(StringDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descriptionDj', instance.descriptionDj);
  val['baseWidgetDjType'] = instance.baseWidgetDjType;
  writeNotNull('value', instance.value);
  return val;
}
