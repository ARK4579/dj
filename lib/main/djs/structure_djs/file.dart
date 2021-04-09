import 'dart:io';

import 'package:path/path.dart' as p;

import 'node.dart';
import '../code_djs/code_djs.dart';

class FileDj extends NodeDj {
  final String fileExtension;
  final List<CodePartDj>? codeParts;

  FileDj({
    fileName,
    this.fileExtension = 'dart',
    this.codeParts,
  }) : super(name: fileName);

  @override
  void create(String baseDirectory) {
    var absolutePath = p.join(baseDirectory, '$name.$fileExtension');

    var file = File(absolutePath);

    print('creating file $absolutePath');
    file.createSync();

    var fileWritter = file.openWrite();
    codeParts?.forEach(
      (code) {
        code.lines().forEach(
          (codeLine) {
            fileWritter.writeln(codeLine);
          },
        );
        fileWritter.writeln('');
      },
    );
    fileWritter.close();
  }
}
