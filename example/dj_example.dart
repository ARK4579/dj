import 'package:dj/dj.dart';

void main() {
  var outputDir = '..\\lib';

  var baseDj = BaseDj(
    path: outputDir,
    node: DirectoryDj(
      directoryName: 'dj_generated',
      nodes: [
        FileDj(
          fileName: 'hello_world',
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
