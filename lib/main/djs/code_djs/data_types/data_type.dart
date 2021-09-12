import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'data_type.g.dart';

enum DataTypeDjType {
  Boolean,
  String,
  // While adding New type here, don't forget to update CodePartDj.fromJson
}

@JsonSerializable()
class DataTypeDj extends CodePartDj {
  final DataTypeDjType dataTypeDjType;

  DataTypeDj({
    descriptionDj,
    baseWidgetDjType,
    required this.dataTypeDjType,
    CodePartDjType codePartDjType = CodePartDjType.DataType,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  String get dataType => throw UnimplementedError();

  factory DataTypeDj.fromJson(Map<String, dynamic> json) {
    var dataTypeDj = _$DataTypeDjFromJson(json);

    switch (dataTypeDj.dataTypeDjType) {
      case DataTypeDjType.Boolean:
        return BooleanDj.fromJson(json);
      case DataTypeDjType.String:
        return StringDj.fromJson(json);
      default:
        throw Exception(
          'DataTypeDj.fromJson not handeled fro $json.',
        );
    }
  }

  @override
  Map<String, dynamic> toJson() => _$DataTypeDjToJson(this);
}
