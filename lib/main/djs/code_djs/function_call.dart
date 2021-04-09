import 'code_part.dart';

class FunctionCallDj extends CodePartDj {
  final String? outputStr;
  final String name;
  final String? arg;
  final List<String>? args;

  FunctionCallDj({
    description,
    this.outputStr,
    required this.name,
    this.arg,
    this.args,
  }) : super(description: description);

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
