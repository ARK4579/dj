import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'function.g.dart';

@JsonSerializable()
class FunctionDj extends CodePartDj {
  @JsonKey(name: 'outputStr')
  final VariableType outputType;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'args')
  final List<FunctionArg>? args;

  @JsonKey(name: 'isAsync')
  final bool isAsync;

  @JsonKey(name: 'bodyCodeParts')
  final List<CodePartDj>? bodyCodeParts;

  FunctionDj({
    description,
    required this.outputType,
    required this.name,
    this.args,
    this.isAsync = false,
    this.bodyCodeParts,
  }) : super(description: description);

  factory FunctionDj.fromJson(Map<String, dynamic> json) =>
      _$FunctionDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FunctionDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var argsLine = args?.map((arg) => '${arg.toString()}').join(', ') ?? '';

    var callLine = '$name($argsLine)';

    if (isAsync) {
      callLine += ' async ';
    }

    var body = '';
    bodyCodeParts?.forEach((codePart) {
      body += codePart.toString();
    });

    var outputStr = variableTypeToString(outputType);

    callLine = '$outputStr $callLine { $body }';

    _lines.add(callLine);
    return _lines;
  }
}
