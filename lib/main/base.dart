import 'package:json_annotation/json_annotation.dart';

import 'djs/djs.dart';

part 'base.g.dart';

@JsonSerializable()
class BaseDj {
  @JsonKey(name: 'baseDirectoryPath')
  final String baseDirectoryPath;

  @JsonKey(name: 'baseNode')
  final DirectoryDj baseNode;

  @JsonKey(name: 'overwite')
  final bool overwite;

  const BaseDj({
    required this.baseDirectoryPath,
    required this.baseNode,
    this.overwite = false,
  });

  factory BaseDj.fromJson(Map<String, dynamic> json) => _$BaseDjFromJson(json);
  Map<String, dynamic> toJson() => _$BaseDjToJson(this);
}
