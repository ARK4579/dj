import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part 'directory.g.dart';

@JsonSerializable()
class DirectoryDj extends NodeDj {
  @JsonKey(name: 'nodes')
  final List<NodeDj>? nodes;

  DirectoryDj({
    directoryName,
    this.nodes,
  }) : super(name: directoryName);

  factory DirectoryDj.fromJson(Map<String, dynamic> json) =>
      _$DirectoryDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DirectoryDjToJson(this);
}
