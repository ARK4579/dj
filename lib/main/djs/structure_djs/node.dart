import 'package:json_annotation/json_annotation.dart';

part 'node.g.dart';

@JsonSerializable()
class NodeDj {
  @JsonKey(name: 'name')
  final String? name;

  const NodeDj({
    required this.name,
  });

  factory NodeDj.fromJson(Map<String, dynamic> json) => _$NodeDjFromJson(json);
  Map<String, dynamic> toJson() => _$NodeDjToJson(this);
}
