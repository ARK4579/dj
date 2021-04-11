import 'package:dj/dj.dart';
import 'package:json_annotation/json_annotation.dart';

import 'structure_types.dart';

part 'node.g.dart';

@JsonSerializable()
class NodeDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'type')
  final StructureType type;

  const NodeDj({
    required this.name,
    required this.type,
  });

  factory NodeDj.fromJson(Map<String, dynamic> json) {
    var nodeDj = _$NodeDjFromJson(json);

    if (nodeDj.type == StructureType.File) {
      return FileDj.fromJson(json);
    } else if (nodeDj.type == StructureType.Directory) {
      return DirectoryDj.fromJson(json);
    }

    return nodeDj;
  }

  Map<String, dynamic> toJson() => _$NodeDjToJson(this);
}
