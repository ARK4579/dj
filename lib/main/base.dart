import 'dart:io';

import 'djs/djs.dart';

class BaseDj {
  final String baseDirectoryPath;
  final DirectoryDj baseNode;
  final bool overwite;

  const BaseDj({
    required this.baseDirectoryPath,
    required this.baseNode,
    this.overwite = false,
  });

  void generate() {
    Directory(baseDirectoryPath).createSync(recursive: true);

    baseNode.create(baseDirectoryPath);
  }
}
