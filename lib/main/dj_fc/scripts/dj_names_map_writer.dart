import 'package:path/path.dart' as p;

import 'package:dj/main/main.dart';

const String FLUTTER_SDK_LOCATION = 'D:\\src\\flutter';

void main() {
  var flutterSdkWidgetProcessor = FlutterSdkWidgetProcessor(
    sdkLocation: FLUTTER_SDK_LOCATION,
    selfJsonSerialization: true,
  );

  var rawWidgets = flutterSdkWidgetProcessor.process();

  var djNamesMap = getDjNamesMap(rawWidgets);

  var outputDir = p.join('..', 'dj_fj', 'lib', 'src');
  var baseDj = BaseDj(
    path: outputDir,
    node: DirectoryDj(
      name: 'widget_djs',
      nodes: [
        FileDj(
          name: 'dj_names_map',
          codeParts: [
            MapDj(
              name: 'djNamesMap',
              keyDataType: 'String',
              valueDataType: 'String',
              values: djNamesMap,
            ),
          ],
        ),
      ],
    ),
  );

  baseDj.writeToDisk();
}
