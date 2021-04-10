// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImportDj _$ImportDjFromJson(Map<String, dynamic> json) {
  return ImportDj(
    description: json['description'],
    importStr: json['importStr'] as String,
  );
}

Map<String, dynamic> _$ImportDjToJson(ImportDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['importStr'] = instance.importStr;
  return val;
}
