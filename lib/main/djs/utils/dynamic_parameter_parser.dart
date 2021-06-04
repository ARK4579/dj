dynamic dynamicParameterParser(dynamic parameter) {
  switch (parameter.runtimeType) {
    case String:
      return '\'$parameter\'';
    default:
      return parameter;
  }
}
