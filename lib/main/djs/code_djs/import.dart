import 'package:json_annotation/json_annotation.dart';
import 'code_part.dart';

part 'import.g.dart';

@JsonSerializable()
class ImportDj extends CodePartDj {
  @JsonKey(name: 'importStr')
  final String importStr;

  ImportDj({
    description,
    this.importStr = '',
  }) : super(description: description);

  factory ImportDj.fromJson(Map<String, dynamic> json) =>
      _$ImportDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ImportDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var importLine = "import '$importStr';";

    _lines.add(importLine);
    return _lines;
  }
}
