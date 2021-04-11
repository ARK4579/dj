import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

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

  String asParameter() {
    var parameter = '';

    if (type != null && name != null) {
      parameter = 'final ${variableTypeToString(type!)} $name; ';
    }

    return parameter;
  }

  String asConstructorArg() {
    var constructorArg = 'this.$name, ';
    if (isRequired) {
      constructorArg = 'required $constructorArg';
    }

    return constructorArg;
  }

  @override
  String toString() {
    var str = '';

    if (type != null) {
      str = variableTypeToString(type!) + ' ';
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
