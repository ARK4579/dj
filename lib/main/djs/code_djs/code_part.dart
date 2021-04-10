import 'package:json_annotation/json_annotation.dart';
import '../utils/utils.dart';

part 'code_part.g.dart';

@JsonSerializable()
class CodePartDj {
  @JsonKey(name: 'description')
  final String? description;

  const CodePartDj({
    this.description,
  });

  factory CodePartDj.fromJson(Map<String, dynamic> json) =>
      _$CodePartDjFromJson(json);
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
