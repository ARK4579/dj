import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'field.g.dart';

@JsonSerializable()
class FieldDj extends CodePartDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'dataType')
  final String? dataType;

  @JsonKey(name: 'safeDataType')
  final String? safeDataType;

  @JsonKey(name: 'safetyDescription')
  final List<String>? safetyDescription;

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
    descriptionDj,
    this.name,
    this.dataType,
    this.safeDataType,
    this.safetyDescription,
    this.isFinal = true,
    this.isRequired = true,
    this.isOptional = false,
    this.superOnly = false,
    this.isStatic = false,
    this.defaultValue,
    CodePartDjType codePartDjType = CodePartDjType.Field,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory FieldDj.fromJson(Map<String, dynamic> json) =>
      _$FieldDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FieldDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    if (name == null) return _lines;

    (safetyDescription ?? []).forEach((safetyDescriptionLine) {
      _lines.add(safetyDescriptionLine);
    });
    var dataTypeLine = appliedDataType;

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

  String get appliedDataType {
    late String dataTypeLine;

    if (safeDataType != null) {
      dataTypeLine = safeDataType!;
    } else if (dataType != null) {
      dataTypeLine = dataType!;
    } else {
      dataTypeLine = 'dynamic';
    }

    return dataTypeLine;
  }

  String get parseAsType {
    var parseAs = '';

    if (dataType != null) {
      if (['String', 'String?', 'bool', 'bool?'].contains(dataType)) {
        parseAs = 'as $dataType';
      }
    }

    return parseAs;
  }

  bool get hasDefaultValue => defaultValue != null;

  bool get isPrivate => (name ?? '').startsWith('_');
}
