import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'enum.g.dart';

@JsonSerializable()
class EnumDj extends CodePartDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'values')
  final List<String>? values;

  EnumDj({
    descriptionDj,
    this.name,
    this.values,
    CodePartDjType codePartDjType = CodePartDjType.Enum,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory EnumDj.fromJson(Map<String, dynamic> json) => _$EnumDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EnumDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    _lines.add('enum $name {');

    values?.forEach((value) {
      _lines.add('$value,');
    });

    _lines.add('}');

    return _lines;
  }
}
