// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_widget_dj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManualWidgetDj _$ManualWidgetDjFromJson(Map<String, dynamic> json) {
  return ManualWidgetDj(
    key: json['key'],
    name: json['name'] as String?,
    params:
        (json['params'] as List<dynamic>?)?.map((e) => e as String).toList(),
    args: json['args'] as Map<String, dynamic>?,
    ignoreArgIfNot: json['ignoreArgIfNot'] as bool?,
    baseWidgetDjType: json['baseWidgetDjType'],
  );
}

Map<String, dynamic> _$ManualWidgetDjToJson(ManualWidgetDj instance) {
  final val = <String, dynamic>{
    'baseWidgetDjType': instance.baseWidgetDjType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('name', instance.name);
  writeNotNull('params', instance.params);
  writeNotNull('args', instance.args);
  writeNotNull('ignoreArgIfNot', instance.ignoreArgIfNot);
  return val;
}
