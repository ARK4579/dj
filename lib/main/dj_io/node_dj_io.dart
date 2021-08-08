import 'package:universal_io/io.dart';

abstract class NodeDjIo {
  void create(String basePath) {
    Directory(basePath).createSync(recursive: true);
  }

  void write() {}
}
