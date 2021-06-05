import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'variable_declaration.g.dart';

@JsonSerializable()
class VariableDeclarationDj extends CodePartDj {
  @JsonKey(name: 'dataType')
  final VariableType? dataType;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'initialValue')
  final String? initialValue;

  VariableDeclarationDj({
    descriptionDj,
    this.dataType,
    this.name,
    this.initialValue,
    CodePartDjType codePartDjType = CodePartDjType.VariableDeclaration,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory VariableDeclarationDj.fromJson(Map<String, dynamic> json) =>
      _$VariableDeclarationDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$VariableDeclarationDjToJson(this);

  @override
  List<String> toCode() {
    var codeLines = super.toCode();

    var declarationLine = '';

    if (dataType != null) {
      declarationLine += variableTypeToString(dataType!) + ' ';
    }

    if (name != null) {
      declarationLine += name! + ' ';
    }

    if (initialValue != null) {
      declarationLine += ' = ' + initialValue! + ';';
    } else if (declarationLine != '') {
      declarationLine += ';';
    }

    codeLines.add(declarationLine);
    return codeLines;
  }
}
