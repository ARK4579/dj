import 'package:json_annotation/json_annotation.dart';
import 'code_part.dart';

part 'import.g.dart';

@JsonSerializable()
class ImportDj extends CodePartDj {
  @JsonKey(name: 'importStr')
  final String importStr;

  @JsonKey(name: 'isPackage')
  final bool isPackage;

  @JsonKey(name: 'isFlutter')
  final bool isFlutter;

  @JsonKey(name: 'isFile')
  final bool isFile;

  @JsonKey(name: 'isPart')
  final bool isPart;

  ImportDj({
    description,
    this.importStr = '',
    this.isPackage = false,
    this.isFlutter = false,
    this.isFile = false,
    this.isPart = false,
    CodePartType type = CodePartType.Import,
  }) : super(
          description: description,
          type: type,
        );

  factory ImportDj.fromJson(Map<String, dynamic> json) =>
      _$ImportDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ImportDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    var importLine = "import '";
    if (isPackage) {
      importLine += 'package:$importStr/$importStr.dart';
    } else if (isFlutter) {
      importLine += 'package:flutter/$importStr.dart';
    } else if (isPart) {
      importLine = "part '$importStr.g.dart";
    } else if (isFile) {
      importLine += '$importStr.dart';
    } else {
      importLine += '$importStr';
    }
    importLine += "';";

    _lines.add(importLine);
    return _lines;
  }
}
