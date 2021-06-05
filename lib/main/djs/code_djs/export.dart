import 'package:json_annotation/json_annotation.dart';
import 'code_part.dart';

part 'export.g.dart';

@JsonSerializable()
class ExportDj extends CodePartDj {
  @JsonKey(name: 'exportStr')
  final String? exportStr;

  ExportDj({
    descriptionDj,
    this.exportStr,
    CodePartDjType codePartDjType = CodePartDjType.Export,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory ExportDj.fromJson(Map<String, dynamic> json) =>
      _$ExportDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ExportDjToJson(this);

  @override
  List<String> toCode() {
    var codeLines = super.toCode();

    var exportLine = "export '$exportStr.dart';";

    codeLines.add(exportLine);
    return codeLines;
  }
}
