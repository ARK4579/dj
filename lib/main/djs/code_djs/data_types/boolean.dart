import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'boolean.g.dart';

@JsonSerializable()
class BooleanDj extends DataTypeDj {
  @JsonKey(name: 'value')
  final bool? value;

  BooleanDj(
    this.value, {
    descriptionDj,
    baseWidgetDjType = 'bool',
    DataTypeDjType dataTypeDjType = DataTypeDjType.Boolean,
    CodePartDjType codePartDjType = CodePartDjType.DataType,
  }) : super(
          baseWidgetDjType: baseWidgetDjType,
          descriptionDj: descriptionDj,
          dataTypeDjType: dataTypeDjType,
          codePartDjType: codePartDjType,
        );

  factory BooleanDj.fromJson(Map<String, dynamic> json) =>
      _$BooleanDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanDjToJson(this);

  @override
  String toString() {
    return value.toString();
  }

  @override
  String get dataType => 'bool';
}
