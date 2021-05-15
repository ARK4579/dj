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
    description,
    this.name,
    this.values,
    CodePartType type = CodePartType.Enum,
  }) : super(
          description: description,
          type: type,
        );

  factory EnumDj.fromJson(Map<String, dynamic> json) => _$EnumDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EnumDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    _lines.add('enum $name {');

    values?.forEach((value) {
      _lines.add('$value,');
    });

    _lines.add('}');

    return _lines;
  }
}