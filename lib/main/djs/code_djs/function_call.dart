import 'package:json_annotation/json_annotation.dart';
import 'code_part.dart';

part 'function_call.g.dart';

@JsonSerializable()
class FunctionCallDj extends CodePartDj {
  @JsonKey(name: 'outputStr')
  final String? outputStr;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'arg')
  final String? arg;

  @JsonKey(name: 'args')
  final List<String>? args;

  FunctionCallDj({
    description,
    this.outputStr,
    required this.name,
    this.arg,
    this.args,
  }) : super(description: description);

  factory FunctionCallDj.fromJson(Map<String, dynamic> json) =>
      _$FunctionCallDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FunctionCallDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var argsLine = arg == null
        ? args?.map((arg) => '${arg.toString()}').join(', ') ?? ''
        : arg.toString();

    var callLine = '$name($argsLine);';

    if (outputStr != null) {
      callLine = '$outputStr = $callLine';
    }

    _lines.add(callLine);
    return _lines;
  }
}
