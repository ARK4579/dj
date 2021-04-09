import '../utils/utils.dart';

abstract class CodePartDj {
  final String? description;

  const CodePartDj({
    this.description,
  });

  List<String> lines() {
    var _lines = <String>[];

    _lines += getSingleLineCommectOnMultipleLines(description);

    return _lines;
  }
}
