import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'single_line.g.dart';

@JsonSerializable()
class SingleLineDj extends CodePartDj {
  @JsonKey(name: 'line')
  final String? line;

  SingleLineDj({
    descriptionDj,
    this.line,
    CodePartDjType codePartDjType = CodePartDjType.SingleLine,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory SingleLineDj.fromJson(Map<String, dynamic> json) =>
      _$SingleLineDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SingleLineDjToJson(this);

  @override
  List<String> toCode() {
    var codeLines = super.toCode();

    if (line != null) {
      codeLines.add(line!);
    }

    return codeLines;
  }
}
