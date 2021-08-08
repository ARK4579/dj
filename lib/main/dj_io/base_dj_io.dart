import 'package:dj/dj.dart';

/// to write generated code from Json to disk as actual dart code
class BaseDjIo {
  final Map<String, dynamic> baseDjMap;

  BaseDjIo({
    required this.baseDjMap,
  });

  void write() {
    print('Writing to Disk...');
    var baseDj = BaseDj.fromJson(baseDjMap);

    var directoryDjIo = DirectoryDjIo(directoryDj: baseDj.node);
    directoryDjIo.create(baseDj.path);
  }
}
