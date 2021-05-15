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

    var superOnlyFields = <FieldDj>[];

    fields?.forEach((field) {
      String? comment;
      var fieldLine = '${field.name}';
      if (field.hasDefaultValue) {
        comment = 'ignoring defaultValue ${field.defaultValue}';
        if (field.superOnly ?? false) {
          superOnlyFields.add(field);
          if (field.name == 'baseWidgetDjType') {
            fieldLine = '$fieldLine = ${field.defaultValue}';
            comment = null;
          } else {
            fieldLine = '$fieldLine';
          }
        } else {
          fieldLine = 'this.$fieldLine';
        }
      } else {
        fieldLine = 'this.$fieldLine';
        if (field.isRequired ?? false) {
          fieldLine = 'required $fieldLine';
        }
      }
      fieldLine += ',';
      if (comment != null) {
        fieldLine += ' // $comment';
      }
      if (!field.isPrivate) {
        codeLines.add(fieldLine);
      }
    });

    if (superOnlyFields.isEmpty) {
      codeLines.add('});');
    } else {
      codeLines.add('}) : super(');
      superOnlyFields.forEach((field) {
        // Ignoring Constructor-Only Fields for Now!
        if (field.name == 'baseWidgetDjType') {
          codeLines.add('${field.name}:${field.name},');
        }
      });
      codeLines.add(');');
    }

    return codeLines;
  }

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    var _jsonSerializable = jsonSerializable ?? false;

    if (name == null) return _lines;

    fields
        ?.where((field) => (!(field.superOnly ?? false) && !field.isPrivate))
        .forEach((field) {
      if (_jsonSerializable) {
        _lines.add("@JsonKey(name: '${field.name}')");
      }
      _lines += field.toCode();
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
