// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_widget_dj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseWidgetDj _$BaseWidgetDjFromJson(Map<String, dynamic> json) {
  return BaseWidgetDj(
    baseWidgetDjType: json['baseWidgetDjType'] as String,
    descriptionDj: json['descriptionDj'],
  );
}

Map<String, dynamic> _$BaseWidgetDjToJson(BaseWidgetDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('descriptionDj', instance.descriptionDj);
  val['baseWidgetDjType'] = instance.baseWidgetDjType;
  return val;
}
