import 'variable_types.dart';

class FunctionArg {
  final VariableType? type;
  final bool isRequired;
  final String? name;

  FunctionArg({
    this.type,
    this.isRequired = true,
    this.name,
  });

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
