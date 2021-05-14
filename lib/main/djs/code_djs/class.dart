import 'package:json_annotation/json_annotation.dart';
import 'package:dj/main/main.dart';

part 'class.g.dart';

@JsonSerializable()
class ClassDj extends CodePartDj {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'baseName')
  final String? baseName;

  @JsonKey(name: 'fields')
  final List<FieldDj>? fields;

  @JsonKey(name: 'isExtends')
  final bool? isExtends;

  @JsonKey(name: 'isImplements')
  final bool? isImplements;

  @JsonKey(name: 'jsonSerializable')
  final bool? jsonSerializable;

  ClassDj({
    description,
    this.name,
    this.baseName,
    this.fields,
    this.isExtends,
    this.isImplements,
    this.jsonSerializable,
    CodePartType type = CodePartType.Class,
  }) : super(
          description: description,
          type: type,
        );

  factory ClassDj.fromJson(Map<String, dynamic> json) =>
      _$ClassDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ClassDjToJson(this);

  List<String> _constructorCode() {
    var codeLines = <String>[];

    codeLines.add('$name({');

    var constructorOnlyFields = <FieldDj>[];

    fields?.forEach((field) {
      var fieldLine = '${field.name}';
      if (field.hasDefaultValue) {
        fieldLine = '$fieldLine = ${field.defaultValue}';
        constructorOnlyFields.add(field);
      } else {
        fieldLine = 'this.$fieldLine';
        if (field.isRequired ?? false) {
          fieldLine = 'required $fieldLine';
        }
      }
      codeLines.add('$fieldLine,');
    });

    if (constructorOnlyFields.isEmpty) {
      codeLines.add('});');
    } else {
      codeLines.add('}) : super(');
      constructorOnlyFields.forEach((field) {
        codeLines.add('${field.name}:${field.name},');
      });
      codeLines.add(');');
    }

    return codeLines;
  }

  @override
  List<String> lines() {
    var _lines = super.lines();

    var _jsonSerializable = jsonSerializable ?? false;

    if (name == null) return _lines;

    fields
        ?.where((field) => !(field.constructorOnly ?? false))
        .forEach((field) {
      if (_jsonSerializable) {
        _lines.add("@JsonKey(name: '${field.name}')");
      }
      _lines += field.lines();
    });

    var baseLine = '';
    if ((isExtends ?? false) && (baseName ?? '').isNotEmpty) {
      baseLine = 'extends $baseName';
    }

    var classStartLine = [
      if (_jsonSerializable) '@JsonSerializable()',
      'class $name $baseLine {'
    ];
    var classEndLine = '}';

    if (jsonSerializable ?? false) {
      var jsFromLine1 = '$name.fromJson(Map<String, dynamic> json)';
      var jsFromLine2 = '_\$${name}FromJson(json);';
      var jsFromLine = 'factory $jsFromLine1 => $jsFromLine2';
      _lines.add(jsFromLine);
    }

    if (jsonSerializable ?? false) {
      _lines.add('@override');
      _lines.add('Map<String, dynamic> toJson() => _\$${name}ToJson(this);');
    }

    _lines = _lines + _constructorCode();

    _lines = classStartLine + _lines + [classEndLine];
    return _lines;
  }
}
