import 'package:json_annotation/json_annotation.dart';

import '../code_djs/code_djs.dart';

import 'node.dart';
import 'structure_types.dart';

part 'file.g.dart';

@JsonSerializable()
class FileDj extends NodeDj {
  @JsonKey(name: 'fileExtension')
  final String? fileExtension;

  @JsonKey(name: 'codeParts')
  final List<CodePartDj>? codeParts;

  FileDj({
    required name,
    fileExtension,
    this.codeParts,
    StructureType type = StructureType.File,
  })  : fileExtension = fileExtension ?? 'dart',
        super(
          name: name,
          type: type,
        );

  factory FileDj.fromJson(Map<String, dynamic> json) => _$FileDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FileDjToJson(this);
}
