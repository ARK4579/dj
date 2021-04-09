import '../utils/utils.dart';

import 'code_part.dart';

class FunctionDj extends CodePartDj {
  final VariableType outputType;
  final String name;
  final List<FunctionArg>? args;
  final bool isAsync;
  final List<CodePartDj>? bodyCodeParts;

  FunctionDj({
    description,
    required this.outputType,
    required this.name,
    this.args,
    this.isAsync = false,
    this.bodyCodeParts,
  }) : super(description: description);

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
