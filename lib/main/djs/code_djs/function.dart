import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'function.g.dart';

@JsonSerializable()
class FunctionDj extends CodePartDj {
  @JsonKey(name: 'outputType')
  final VariableType? outputType;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'args')
  final List<FunctionArg>? args;

  @JsonKey(name: 'isAsync')
  final bool isAsync;

  @JsonKey(name: 'bodyCodeParts')
  final List<CodePartDj>? bodyCodeParts;

  @JsonKey(name: 'annotations')
  final List<String>? annotations;

  FunctionDj({
    descriptionDj,
    this.outputType,
    required this.name,
    this.args,
    this.isAsync = false,
    this.bodyCodeParts,
    this.annotations,
    CodePartDjType codePartDjType = CodePartDjType.Function,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory FunctionDj.fromJson(Map<String, dynamic> json) =>
      _$FunctionDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FunctionDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    var argsLine = args?.map((arg) => '${arg.toString()}').join(', ') ?? '';

    var callLine = '';

    callLine += '$name($argsLine)';

    if (isAsync) {
      callLine += ' async ';
    }

    var body = '';
    bodyCodeParts?.forEach((codePart) {
      body += codePart.toString();
    });

    callLine = '$callLine { $body }';

    if (outputType != null) {
      callLine = variableTypeToString(outputType!) + ' ' + callLine;
    }

    if (annotations != null) {
      annotations!.forEach((annotation) {
        callLine = '@$annotation\n' + callLine;
      });
    }

    _lines.add(callLine);
    return _lines;
  }
}
