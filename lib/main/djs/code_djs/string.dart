import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'string.g.dart';

@JsonSerializable()
class StringDj extends CodePartDj {
  @JsonKey(name: 'value')
  final bool? value;

  StringDj({
    descriptionDj,
    this.value,
    CodePartDjType codePartDjType = CodePartDjType.String,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory StringDj.fromJson(Map<String, dynamic> json) =>
      _$StringDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StringDjToJson(this);
}
