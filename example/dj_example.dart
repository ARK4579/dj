import 'package:dj/main/djs/code_djs/if_else.dart';
import 'package:path/path.dart' as p;

import 'package:dj/dj.dart';

void main() {
  var outputDir = p.join('example');

  // Using 'dj' library to generate code structure
  var baseDj = BaseDj(
    path: outputDir,
    node: DirectoryDj(
      name: 'dj_example_generated',
      nodes: [
        FileDj(
          name: 'hello_world',
          codeParts: [
            FunctionDj(
              descriptionDj: 'Main entry point to this file!',
              outputType: VariableType.Void,
              name: 'main',
              bodyCodeParts: [
                FunctionCallDj(
                  name: 'print',
                  arg: StringDj('Hello World!'),
                ),
                IfElseDj(
                  conditions: [
                    Condition(
                      conditionLeft: '1',
                      operator: Operator.Equal,
                      conditionRight: '2',
                      body: FunctionCallDj(
                        name: 'print',
                        arg: StringDj('Its True! 1 equals 2 now!'),
                      ),
                    ),
                    Condition(
                      conditionLeft: '2',
                      operator: Operator.Equal,
                      conditionRight: '1',
                      body: FunctionCallDj(
                        name: 'print',
                        arg: StringDj('Its True! Apparently 2 equals 1 now!'),
                      ),
                    ),
                    Condition(
                      body: FunctionCallDj(
                        name: 'print',
                        arg: StringDj('Its False!'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ClassDj(
              name: 'SampleClass',
              fields: [
                FieldDj(
                  name: 'isSample',
                  defaultValue: BooleanDj(true),
                ),
              ],
              selfJsonSerialization: true,
            ),
          ],
        ),
      ],
    ),
  );

  // Generated code and writting it to disk
  baseDj.writeToDisk();
}
