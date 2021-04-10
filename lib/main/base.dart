import 'package:json_annotation/json_annotation.dart';

import 'djs/djs.dart';

part 'base.g.dart';

@JsonSerializable()
class BaseDj {
  @JsonKey(name: 'path')
  final String path;

  @JsonKey(name: 'node')
  final DirectoryDj node;

  @JsonKey(name: 'overwite')
  final bool overwite;

  const BaseDj({
    required this.path,
    required this.node,
    this.overwite = false,
  });

  factory BaseDj.fromJson(Map<String, dynamic> json) => _$BaseDjFromJson(json);
  Map<String, dynamic> toJson() => _$BaseDjToJson(this);
}
