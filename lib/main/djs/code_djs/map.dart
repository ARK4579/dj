import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'map.g.dart';

@JsonSerializable()
class MapDj extends CodePartDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'keyDataType')
  final String? keyDataType;

  @JsonKey(name: 'valueDataType')
  final String? valueDataType;

  @JsonKey(name: 'values')
  final Map<String, String>? values;

  MapDj({
    descriptionDj,
    this.name,
    this.keyDataType,
    this.valueDataType,
    this.values,
    CodePartDjType codePartDjType = CodePartDjType.Map,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory MapDj.fromJson(Map<String, dynamic> json) => _$MapDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MapDjToJson(this);

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    if (name == null) return _lines;

    var _keyDataType = keyDataType ?? 'dynamic';
    var _valueDataType = valueDataType ?? 'dynamic';

    _lines.add('var $name = <$_keyDataType,$_valueDataType>{');

    values?.forEach((key, value) {
      _lines.add("'$key':'$value',");
    });

    _lines.add('};');

    return _lines;
  }
}
