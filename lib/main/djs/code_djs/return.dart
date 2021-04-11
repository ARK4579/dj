import 'package:json_annotation/json_annotation.dart';
import 'code_part.dart';

part 'return.g.dart';

@JsonSerializable()
class ReturnDj extends CodePartDj {
  @JsonKey(name: 'returnStr')
  final String returnStr;

  ReturnDj({
    description,
    this.returnStr = '',
    CodePartType type = CodePartType.Return,
  }) : super(
          description: description,
          type: type,
        );

  factory ReturnDj.fromJson(Map<String, dynamic> json) =>
      _$ReturnDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ReturnDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var returnLine = 'return $returnStr;';

    _lines.add(returnLine);
    return _lines;
  }
}
