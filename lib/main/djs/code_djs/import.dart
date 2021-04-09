import 'code_part.dart';

class ImportDj extends CodePartDj {
  final String importStr;

  ImportDj({
    description,
    this.importStr = '',
  }) : super(description: description);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var importLine = "import '$importStr';";

    _lines.add(importLine);
    return _lines;
  }
}
