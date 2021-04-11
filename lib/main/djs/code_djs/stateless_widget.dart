import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'stateless_widget.g.dart';

@JsonSerializable()
class StatelessWidgetDj extends CodePartDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'args')
  final List<FunctionArg>? args;

  @JsonKey(name: 'body')
  final List<CodePartDj>? body;

  StatelessWidgetDj({
    description,
    this.name,
    this.args,
    this.body,
    CodePartType type = CodePartType.StatelessWidget,
  }) : super(
          description: description,
          type: type,
        );

  factory StatelessWidgetDj.fromJson(Map<String, dynamic> json) =>
      _$StatelessWidgetDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StatelessWidgetDjToJson(this);

  @override
  List<String> lines() {
    var _lines = super.lines();

    var bodyLines = [];
    body?.forEach((body) {
      bodyLines += body.lines();
    });
    var bodyStr = bodyLines.join(' ');

    var contructorArgs = args?.map((e) => e.asConstructorArg()).toList() ?? [];
    var argsLine = contructorArgs.join(', ');
    argsLine = argsLine == '' ? argsLine : '{$argsLine}';

    var parmeters = args?.map((e) => e.asParameter()).toList() ?? [];
    var paramtersStr = parmeters.join(' ');

    var widgetLine = '';
    widgetLine += 'class $name extends StatelessWidget {';
    widgetLine += '$paramtersStr $name($argsLine);';
    widgetLine += '@override Widget build(BuildContext context) { $bodyStr }';
    widgetLine += '}';

    _lines.add(widgetLine);
    return _lines;
  }
}
