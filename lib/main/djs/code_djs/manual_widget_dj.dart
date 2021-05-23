import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'manual_widget_dj.g.dart';

@JsonSerializable()
class ManualWidgetDj extends BaseWidgetDj {
  @JsonKey(name: 'key')
  dynamic key;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'params')
  List<String>? params;

  @JsonKey(name: 'args')
  Map<String, dynamic>? args;

  // Should the arg be ignored in toCode conversation if null or empty
  @JsonKey(name: 'ignoreArgIfNot')
  bool? ignoreArgIfNot;

  ManualWidgetDj({
    this.key,
    this.name,
    this.params,
    this.args,
    this.ignoreArgIfNot = true,
    baseWidgetDjType = 'ManualWidget',
  }) : super(
          baseWidgetDjType: baseWidgetDjType,
        );

  bool get ignoreArgIfNotNN => ignoreArgIfNot ?? true;

  @override
  List<String> toCode() {
    var codeLines = super.toCode();

    if (name == null) {
      return codeLines;
    }

    codeLines.add('$name(');

    if (key != null) {
      codeLines.add('key:$key,');
    }

    String? getValueString(value) {
      switch (value.runtimeType) {
        case Null:
          if (!ignoreArgIfNotNN) {
            return '$value';
          }
          break;
        case String:
          return "'$value'";
        default:
          return '$value';
      }
    }

    params?.forEach((param) {
      codeLines.add('${getValueString(param)},');
    });

    args?.forEach((key, value) {
      var valueString = getValueString(value);
      if (valueString != null) {
        codeLines.add('$key:$valueString');
      }
    });

    codeLines.add(')');
    return codeLines;
  }
}
