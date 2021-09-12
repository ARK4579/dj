import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'boolean.g.dart';

@JsonSerializable()
class BooleanDj extends BaseWidgetDj {
  @JsonKey(name: 'value')
  final bool? value;

  BooleanDj({
    descriptionDj,
    this.value,
    baseWidgetDjType = 'bool',
  }) : super(
          baseWidgetDjType: baseWidgetDjType,
          descriptionDj: descriptionDj,
        );

  String get dataType => baseWidgetDjType;

  factory BooleanDj.fromJson(Map<String, dynamic> json) =>
      _$BooleanDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanDjToJson(this);

  @override
  String toString() {
    return value.toString();
  }
}
