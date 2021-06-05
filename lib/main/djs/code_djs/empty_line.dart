import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'empty_line.g.dart';

@JsonSerializable()
class EmptyLineDj extends CodePartDj {
  EmptyLineDj({
    descriptionDj,
    CodePartDjType codePartDjType = CodePartDjType.EmptyLine,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory EmptyLineDj.fromJson(Map<String, dynamic> json) =>
      _$EmptyLineDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EmptyLineDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    _lines.add('');

    return _lines;
  }
}
