import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'base_widget_dj.g.dart';

@JsonSerializable()
class BaseWidgetDj extends CodePartDj {
  @JsonKey(name: 'baseWidgetDjType')
  final String baseWidgetDjType;

  BaseWidgetDj({
    required this.baseWidgetDjType,
    descriptionDj,
    CodePartDjType codePartDjType = CodePartDjType.BaseWidget,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory BaseWidgetDj.fromJson(Map<String, dynamic> json) =>
      _$BaseWidgetDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BaseWidgetDjToJson(this);
}
