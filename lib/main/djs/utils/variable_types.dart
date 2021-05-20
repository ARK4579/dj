enum VariableType {
  Void,
  String,
  StringNullable,
  ListString,
  ListStringNullable,
  Var,
  // Don't forget to handle Newly Added Variable Types in function below
}

String variableTypeToString(VariableType type) {
  switch (type) {
    case VariableType.Void:
      return 'void';
    case VariableType.String:
      return 'String';
    case VariableType.StringNullable:
      return 'String?';
    case VariableType.ListString:
      return 'List<String>';
    case VariableType.ListStringNullable:
      return 'List<String>?';
    case VariableType.Var:
      return 'var';
    default:
      return 'UNKNOWN_VARIABLE_TYPE';
  }
}
