import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'string.g.dart';

@JsonSerializable()
class StringDj extends DataTypeDj {
  @JsonKey(name: 'value')
  final String value;

  StringDj(
    this.value, {
    descriptionDj,
    baseWidgetDjType = 'String',
    DataTypeDjType dataTypeDjType = DataTypeDjType.String,
    CodePartDjType codePartDjType = CodePartDjType.DataType,
  }) : super(
          baseWidgetDjType: baseWidgetDjType,
          descriptionDj: descriptionDj,
          dataTypeDjType: dataTypeDjType,
          codePartDjType: codePartDjType,
        );

  factory StringDj.fromJson(Map<String, dynamic> json) =>
      _$StringDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StringDjToJson(this);

  @override
  String toString() {
    return "'$value'";
  }

  @override
  String get dataType => 'String';
}
