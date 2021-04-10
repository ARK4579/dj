import 'package:json_annotation/json_annotation.dart';

import 'node.dart';
import 'structure_types.dart';

part 'directory.g.dart';

@JsonSerializable()
class DirectoryDj extends NodeDj {
  @JsonKey(name: 'nodes')
  final List<NodeDj>? nodes;

  DirectoryDj({
    required name,
    this.nodes,
    StructureType type = StructureType.Directory,
  }) : super(
          name: name,
          type: type,
        );

  factory DirectoryDj.fromJson(Map<String, dynamic> json) =>
      _$DirectoryDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DirectoryDjToJson(this);
}
