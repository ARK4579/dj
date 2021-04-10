import 'node.dart';
import 'package:json_annotation/json_annotation.dart';
import '../code_djs/code_djs.dart';

part 'file.g.dart';

@JsonSerializable()
class FileDj extends NodeDj {
  @JsonKey(name: 'fileExtension')
  final String fileExtension;

  @JsonKey(name: 'codeParts')
  final List<CodePartDj>? codeParts;

  FileDj({
    fileName,
    this.fileExtension = 'dart',
    this.codeParts,
  }) : super(name: fileName);

  factory FileDj.fromJson(Map<String, dynamic> json) => _$FileDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FileDjToJson(this);
}
