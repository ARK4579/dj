import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'boolean.g.dart';

@JsonSerializable()
class BooleanDj extends CodePartDj {
  @JsonKey(name: 'value')
  final bool? value;

  BooleanDj({
    descriptionDj,
    this.value,
    CodePartDjType codePartDjType = CodePartDjType.Boolean,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory BooleanDj.fromJson(Map<String, dynamic> json) =>
      _$BooleanDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanDjToJson(this);
}
