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

  factory NodeDj.fromJson(Map<String, dynamic> json) => _$NodeDjFromJson(json);
  Map<String, dynamic> toJson() => _$NodeDjToJson(this);
}
