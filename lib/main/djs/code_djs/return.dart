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
    CodePartDjType codePartDjType = CodePartDjType.Return,
  }) : super(
          description: description,
          codePartDjType: codePartDjType,
        );

  factory ReturnDj.fromJson(Map<String, dynamic> json) =>
      _$ReturnDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ReturnDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    var returnLine = 'return $returnStr;';

    _lines.add(returnLine);
    return _lines;
  }
}
