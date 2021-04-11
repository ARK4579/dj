import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'code_part.g.dart';

enum CodePartType {
  FunctionCall,
  Function,
  IfElse,
  Import,
  StatelessWidget,
}

@JsonSerializable()
class CodePartDj {
  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'type')
  final CodePartType? type;

  const CodePartDj({
    this.description,
    this.type,
  });

  factory CodePartDj.fromJson(Map<String, dynamic> json) {
    var codePartDj = _$CodePartDjFromJson(json);

    switch (codePartDj.type) {
      case CodePartType.Function:
        return FunctionDj.fromJson(json);
      case CodePartType.FunctionCall:
        return FunctionCallDj.fromJson(json);
      case CodePartType.IfElse:
        return IfElseDj.fromJson(json);
      case CodePartType.Import:
        return ImportDj.fromJson(json);
      case CodePartType.StatelessWidget:
        return StatelessWidgetDj.fromJson(json);
      default:
        throw Exception(
            'CodePartDj.fromJson not handled for ${codePartDj.type}');
    }
  }

  Map<String, dynamic> toJson() => _$CodePartDjToJson(this);

  List<String> lines() {
    var _lines = <String>[];

    _lines += getSingleLineCommectOnMultipleLines(description);

    return _lines;
  }

  @override
  String toString() {
    return lines().join(' ');
  }
}
