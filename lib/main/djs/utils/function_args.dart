import 'package:json_annotation/json_annotation.dart';
import 'variable_types.dart';

part 'function_args.g.dart';

@JsonSerializable()
class FunctionArg {
  @JsonKey(name: 'type')
  final VariableType? type;

  @JsonKey(name: 'isRequired')
  final bool isRequired;

  @JsonKey(name: 'name')
  final String? name;

  FunctionArg({
    this.type,
    this.isRequired = true,
    this.name,
  });

  factory FunctionArg.fromJson(Map<String, dynamic> json) =>
      _$FunctionArgFromJson(json);
  Map<String, dynamic> toJson() => _$FunctionArgToJson(this);

  @override
  String toString() {
    var str = '';

    if (type != null) {
      str = type.toString() + ' ';
    }

    if (name != null) {
      str += name!;
    }

    if (isRequired && str != '') {
      str = 'required ' + str;
    }

    return str;
  }
}
