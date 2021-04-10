// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'function_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FunctionCallDj _$FunctionCallDjFromJson(Map<String, dynamic> json) {
  return FunctionCallDj(
    description: json['description'],
    outputStr: json['outputStr'] as String?,
    name: json['name'] as String,
    arg: json['arg'] as String?,
    args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$FunctionCallDjToJson(FunctionCallDj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('outputStr', instance.outputStr);
  val['name'] = instance.name;
  writeNotNull('arg', instance.arg);
  writeNotNull('args', instance.args);
  return val;
}
