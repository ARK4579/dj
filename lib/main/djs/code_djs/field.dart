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

  @JsonKey(name: 'isOptional')
  final bool? isOptional;

  @JsonKey(name: 'isStatic')
  final bool? isStatic;

  @JsonKey(name: 'superOnly')
  final bool? superOnly;

  @JsonKey(name: 'defaultValue')
  final dynamic defaultValue;

  FieldDj({
    description,
    this.name,
    this.dataType,
    this.isFinal = true,
    this.isRequired = true,
    this.isOptional = false,
    this.superOnly = false,
    this.isStatic = false,
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

    if (dataType != null &&
        dataType != 'dynamic' &&
        !djNamesMap.keys.contains(dataType) &&
        !dataType!.contains('<')) {
      if (!unKnownDataTypes.contains(dataType)) {
        unKnownDataTypes.add(dataType!);
      }
    }

    var dataTypeLine = 'dynamic';
    if (dataType != null) {
      var mappedDataType = djNamesMap[dataType];
      if (!dataType!.contains('<')) {
        _lines.add(
          "// Setting data type of following field to be 'dynamic' instead of",
        );
        _lines.add(
          '// $dataType Because Generics are not handled yet',
        );
      } else if (mappedDataType == null) {
        _lines.add(
          "// Setting data type of following field to be 'dynamic' instead of",
        );
        _lines.add(
          "// $dataType Because $dataType's Dj Version Not implemented yet",
        );
      } else if (hasDefaultValue) {
        _lines.add(
          "// Setting data type of following field to be 'dynamic' instead of",
        );
        _lines.add(
          '// $dataType because Non-Dj default value is provided.',
        );
      } else if (!dataType!.endsWith('?') && !(isRequired ?? true)) {
        _lines.add(
          "// Setting data type of following field to be 'dynamic' instead of",
        );
        _lines.add(
          '// $dataType because for some reason default value is not parsed.',
        );
      } else {
        dataTypeLine = mappedDataType;
      }
    }
    // var dataTypeLine = dataType == null
    //     ? 'dynamic'
    //     : (dataType!.contains('<'))
    //         ? 'dynamic'
    //         // : djNamesMap[dataType] ?? dataType!;
    //         : djNamesMap[dataType] ?? 'dynamic';
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

  bool get isPrivate => (name ?? '').startsWith('_');

  static List<String> unKnownDataTypes = [];
}
