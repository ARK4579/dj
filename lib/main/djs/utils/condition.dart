import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'condition.g.dart';

enum Operator {
  Equal,
  NotEqual,
  Is,
}

String getOperatorStr(Operator? operator) {
  if (operator == null) return '';

  switch (operator) {
    case Operator.Equal:
      return '==';
    case Operator.NotEqual:
      return '!=';
    case Operator.Is:
      return 'is';
    default:
  }

  return '';
}

@JsonSerializable()
class Condition {
  @JsonKey(name: 'conditionLeft')
  final String? conditionLeft;

  @JsonKey(name: 'operator')
  final Operator? operator;

  @JsonKey(name: 'conditionRight')
  final String? conditionRight;

  @JsonKey(name: 'body')
  final CodePartDj? body;

  const Condition({
    this.conditionLeft,
    this.operator,
    this.conditionRight,
    this.body,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  List<String> lines({
    bool addElse = false,
  }) {
    var _lines = <String>[];

    var operatorStr = getOperatorStr(operator);

    var conditionLine = '';
    if (conditionLeft != null && conditionRight != null && operator != null) {
      conditionLine = '$conditionLeft $operatorStr $conditionRight';
    } else if (conditionLeft != null && operator != null) {
      conditionLine = '$conditionLeft $operatorStr';
    } else if (conditionLeft != null) {
      conditionLine = '$conditionLeft';
    }

    var conditionBody = body?.lines().join(' ');

    var condition = '{ $conditionBody }';

    if (conditionLine != '') {
      condition = 'if($conditionLine) $condition';
    }

    if (addElse) {
      condition = ' else $condition';
    }

    _lines.add(condition);
    return _lines;
  }
}
