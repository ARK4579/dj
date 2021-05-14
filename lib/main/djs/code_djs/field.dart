import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

import '../widget_djs/dj_names_map.dart';

part 'field.g.dart';

@JsonSerializable()
class FieldDj extends CodePartDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'dataType')
  final String? dataType;

  @JsonKey(name: 'isFinal')
  final bool? isFinal;

  @JsonKey(name: 'isRequired')
  final bool? isRequired;

  @JsonKey(name: 'isStatic')
  final bool? isStatic;

  @JsonKey(name: 'constructorOnly')
  final bool? constructorOnly;

  @JsonKey(name: 'defaultValue')
  final dynamic defaultValue;

  FieldDj({
    description,
    this.name,
    this.dataType,
    this.isFinal = true,
    this.isRequired = true,
    this.isStatic = false,
    this.constructorOnly = false,
    this.defaultValue,
    CodePartType type = CodePartType.Field,
  }) : super(
          description: description,
          type: type,
        );

  factory FieldDj.fromJson(Map<String, dynamic> json) =>
      _$FieldDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FieldDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    if (name == null) return _lines;

    if (dataType != null && dataType != 'dynamic') {
      print('$dataType : ${djNamesMap[dataType]}');
    }

    var dataTypeLine =
        dataType == null ? 'dynamic' : djNamesMap[dataType] ?? dataType;
    var fieldLine = '$dataTypeLine $name;';

    if (isFinal ?? false) {
      fieldLine = 'final $fieldLine';
    }

    _lines.add(fieldLine);
    return _lines;
  }

  //
  // Getters
  //

  bool get hasDefaultValue => defaultValue != null;
}
