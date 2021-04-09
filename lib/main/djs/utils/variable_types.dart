enum VariableType {
  Void,
  String,
  StringNullable,
}

String variableTypeToString(VariableType type) {
  switch (type) {
    case VariableType.Void:
      return 'void';
    case VariableType.String:
      return 'String';
    case VariableType.StringNullable:
      return 'String?';
    default:
      return 'UNKNOWN_VARIABLE_TYPE';
  }
}
