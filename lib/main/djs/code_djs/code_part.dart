import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'code_part.g.dart';

enum CodePartDjType {
  FunctionCall,
  Function,
  IfElse,
  Import,
  StatelessWidget,
  Return,
  Class,
  Field,
  Enum,
  Map,
  // While adding New type here, don't forget to update CodePartDj.fromJson
}

@JsonSerializable()
class CodePartDj {
  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'codePartDjType')
  final CodePartDjType? codePartDjType;

  const CodePartDj({
    this.description,
    this.codePartDjType,
  });

  factory CodePartDj.fromJson(Map<String, dynamic> json) {
    var codePartDj = _$CodePartDjFromJson(json);

    switch (codePartDj.codePartDjType) {
      case CodePartDjType.Function:
        return FunctionDj.fromJson(json);
      case CodePartDjType.FunctionCall:
        return FunctionCallDj.fromJson(json);
      case CodePartDjType.IfElse:
        return IfElseDj.fromJson(json);
      case CodePartDjType.Import:
        return ImportDj.fromJson(json);
      case CodePartDjType.Return:
        return ReturnDj.fromJson(json);
      case CodePartDjType.Class:
        return ClassDj.fromJson(json);
      case CodePartDjType.Field:
        return FieldDj.fromJson(json);
      case CodePartDjType.Enum:
        return EnumDj.fromJson(json);
      case CodePartDjType.Map:
        return MapDj.fromJson(json);
      default:
        throw Exception(
            'CodePartDj.fromJson not handled for ${codePartDj.codePartDjType}');
    }
  }

  Map<String, dynamic> toJson() => _$CodePartDjToJson(this);

  List<String> toCode() {
    var _lines = <String>[];

    _lines += getSingleLineCommentOnMultipleLines(description);

    return _lines;
  }

  @override
  String toString() {
    return toCode().join(' ');
  }
}
