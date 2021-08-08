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
  final bool jsonSerializable;

  @JsonKey(name: 'functions')
  final List<CodePartDj>? functions;

  @JsonKey(name: 'selfJsonSerialization')
  final bool selfJsonSerialization;

  ClassDj({
    descriptionDj,
    this.name,
    this.baseName,
    this.fields,
    this.isExtends,
    this.isImplements,
    this.jsonSerializable = false,
    this.functions,
    this.selfJsonSerialization = false,
    CodePartDjType codePartDjType = CodePartDjType.Class,
  }) : super(
          descriptionDj: descriptionDj,
          codePartDjType: codePartDjType,
        );

  factory ClassDj.fromJson(Map<String, dynamic> json) =>
      _$ClassDjFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ClassDjToJson(this);

  List<String> _nameLineCode() {
    var codeLines = <String>[];

    var baseLine = '';
    if ((isExtends ?? false) && (baseName ?? '').isNotEmpty) {
      baseLine = 'extends $baseName';
    }
    var classStartLine = [
      if (jsonSerializable) '@JsonSerializable()',
      'class $name $baseLine {'
    ];
    codeLines += classStartLine;

    return codeLines;
  }

  List<FieldDj>? get _intrestingFields => fields
      ?.where((field) =>
          (!(field.superOnly ?? false) && !field.isPrivate) &&
          field.name != null)
      .toList();

  List<String> _fieldsCode() {
    var codeLines = <String>[];

    _intrestingFields?.forEach((field) {
      if (jsonSerializable) {
        codeLines.add("@JsonKey(name: '${field.name}')");
      }
      codeLines += field.toCode();
      codeLines.add('');
    });

    return codeLines;
  }

  List<String> _constructorCode() {
    var codeLines = <String>[];

    codeLines.add('$name({');

    var superOnlyFields = <FieldDj>[];

    fields?.forEach((field) {
      String? comment;
      var fieldLine = '${field.name}';
      if (field.superOnly ?? false) {
        superOnlyFields.add(field);
        if (field.defaultValue != null) {
          fieldLine = '$fieldLine = ${field.defaultValue}';
        } else {
          fieldLine = '$fieldLine';
        }
      } else if (field.hasDefaultValue) {
        comment = 'ignoring defaultValue ${field.defaultValue}';
        fieldLine = 'this.$fieldLine';
      } else {
        fieldLine = 'this.$fieldLine';
        if ((field.isRequired ?? false) &&
            (field.appliedDataType != 'dynamic')) {
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
        codeLines.add('${field.name}:${field.name},');
      });
      codeLines.add(');');
    }

    return codeLines;
  }

  List<String> _functionsCode() {
    var codeLines = <String>[];

    if (functions != null) {
      codeLines.add('\n');
      functions?.forEach((function) {
        codeLines += function.toCode();
      });
    }

    return codeLines;
  }

  List<String> _jsonSerializableCode() {
    var codeLines = <String>[];

    // if we are going to generate to/from json code for this class we won't be
    // needing JsonSerializable
    if (jsonSerializable) {
      codeLines.add('');
      var jsFromLine1 = '$name.fromJson(Map<String, dynamic> json)';
      var jsFromLine2 = '_\$${name}FromJson(json);';
      var jsFromLine = 'factory $jsFromLine1 => $jsFromLine2';
      codeLines.add(jsFromLine);

      codeLines.add('');
      codeLines.add('@override');
      codeLines.add('Map<String, dynamic> toJson() => _\$${name}ToJson(this);');
    }

    return codeLines;
  }

  List<String> _selfJsonSerializableCode() {
    var codeLines = <String>[];

    if (selfJsonSerialization) {
      // From Json Code
      codeLines.add('');
      codeLines.add('factory $name.fromJson(Map<String, dynamic> json) {');

      codeLines.add('return $name(');
      _intrestingFields?.forEach((field) {
        codeLines
            .add("${field.name}: json['${field.name}'] ${field.parseAsType},");
      });
      codeLines.add('); }');

      // To Json Code
      codeLines.add('');
      codeLines.add('@override');
      codeLines.add('Map<String, dynamic> toJson() {');
      codeLines.add('final val = <String, dynamic>{};');
      codeLines.add('');
      codeLines.add('void writeNotNull(String key, dynamic value) {');
      codeLines.add('if (value != null) {');
      codeLines.add('val[key] = value;');
      codeLines.add('} }');
      codeLines.add('');

      _intrestingFields?.forEach((field) {
        codeLines.add("writeNotNull('${field.name}', ${field.name});");
      });

      codeLines.add('return val;');
      codeLines.add('}');
    }

    return codeLines;
  }

  @override
  List<String> toCode() {
    var _lines = super.toCode();

    if (name == null) return _lines;

    _lines += _nameLineCode() +
        _fieldsCode() +
        _constructorCode() +
        _functionsCode() +
        _jsonSerializableCode() +
        _selfJsonSerializableCode() +
        ['}']; // class end line

    return _lines;
  }
}
