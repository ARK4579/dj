import 'dart:io';

import 'package:path/path.dart' as p;

import 'node.dart';

class DirectoryDj extends NodeDj {
  final List<NodeDj> nodes;

  DirectoryDj({
    required directoryName,
    this.nodes = const [],
  }) : super(name: directoryName);

  @override
  void create(String baseDirectory) {
    var absolutePath = p.join(baseDirectory, name);

    print('creating directory $absolutePath');
    Directory(absolutePath).createSync();

    nodes.forEach((node) => node.create(absolutePath));
  }
}
