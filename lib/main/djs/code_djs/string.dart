import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'string.g.dart';

@JsonSerializable()
class StringDj extends BaseWidgetDj {
  @JsonKey(name: 'value')
  final String? value;

  StringDj({
    descriptionDj,
    this.value,
    baseWidgetDjType = 'String',
  }) : super(
          baseWidgetDjType: baseWidgetDjType,
          descriptionDj: descriptionDj,
        );

  String get dataType => baseWidgetDjType;

  factory StringDj.fromJson(Map<String, dynamic> json) =>
      _$StringDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StringDjToJson(this);

  @override
  String toString() {
    return "'$value'";
  }
}
