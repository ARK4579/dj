import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'code_part.g.dart';

typedef CustomJsonConverter = CodePartDj Function(Map<String, dynamic> json);

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
  EmptyLine,
  VariableDeclaration,
  SingleLine,
  Export,
  BaseWidget,
  DataType,
  CustomType,
  // While adding New type here, don't forget to update CodePartDj.fromJson
}

@JsonSerializable()
class CodePartDj {
  @JsonKey(name: 'descriptionDj')
  final String? descriptionDj;

  @JsonKey(name: 'codePartDjType')
  final CodePartDjType codePartDjType;

  const CodePartDj({
    this.descriptionDj,
    required this.codePartDjType,
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
      case CodePartDjType.EmptyLine:
        return EmptyLineDj.fromJson(json);
      case CodePartDjType.VariableDeclaration:
        return VariableDeclarationDj.fromJson(json);
      case CodePartDjType.SingleLine:
        return SingleLineDj.fromJson(json);
      case CodePartDjType.Export:
        return ExportDj.fromJson(json);
      case CodePartDjType.BaseWidget:
        return BaseWidgetDj.fromJson(json);
      case CodePartDjType.DataType:
        return DataTypeDj.fromJson(json);
      case CodePartDjType.CustomType:
        return CodePartDj.customJsonConverter!(json);
      default:
        throw Exception(
          'CodePartDj.extendedJsonConverter not implemented.',
        );
    }
  }

  Map<String, dynamic> toJson() => _$CodePartDjToJson(this);

  List<String> toCode() {
    var _lines = <String>[];

    _lines += getSingleLineCommentOnMultipleLines(descriptionDj);

    return _lines;
  }

  @override
  String toString() {
    return toCode().join(' ');
  }

  //
  // Static
  //

  static CustomJsonConverter? customJsonConverter;
}
