# dj

Auto-Generate Dart and Flutter Code while retaining manual user updates to generated code.

## Usage

A simple usage example:

```dart
import 'package:dj/dj.dart';

void main() {
  var outputDir = '..\\lib';

  var baseDj = BaseDj(
    path: outputDir,
    node: DirectoryDj(
      name: 'dj_generated',
      nodes: [
        FileDj(
          name: 'hello_world',
          codeParts: [
            // This import is really not needed in generated file
            // Adding this line for demonstration only!
            ImportDj(importStr: 'package:io/io.dart'),
            FunctionDj(
              description: 'Main entry point to this file!',
              outputType: VariableType.Void,
              name: 'main',
              bodyCodeParts: [
                FunctionCallDj(
                  name: 'print',
                  args: ["'Hellow World!'"],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  // Generating Json for Auto-Generated code
  var baseDjMap = baseDj.toJson();

  print('Auto-Generated Code:');
  print(baseDjMap);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ARK4579/dj/issues
