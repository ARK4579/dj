import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'if_else.g.dart';

@JsonSerializable()
class IfElseDj extends CodePartDj {
  @JsonKey(name: 'conditions')
  final List<Condition>? conditions;

  IfElseDj({
    description,
    this.conditions,
  }) : super(description: description);

  factory IfElseDj.fromJson(Map<String, dynamic> json) =>
      _$IfElseDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$IfElseDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var i = 0;
    conditions?.forEach((condition) {
      var addElse = (i == 0) || (i == conditions!.length - 1);

      _lines += condition.lines(addElse: addElse);

      i++;
    });

    return _lines;
  }
}
