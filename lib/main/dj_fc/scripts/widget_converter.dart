import 'package:path/path.dart' as p;

import 'package:dj/main/main.dart';

import 'utils.dart';

const String FLUTTER_SDK_LOCATION =
    'C:\\Programs\\flutter\\flutter_windows\\flutter';

void main() {
  var flutterSdkWidgetProcessor = FlutterSdkWidgetProcessor(
    sdkLocation: FLUTTER_SDK_LOCATION,
    selfJsonSerialization: true,
  );

  var rawWidgets = flutterSdkWidgetProcessor.process();

  var djNamesMap = getDjNamesMap(rawWidgets);

  var outputDir = p.join('widget_djs');

  writeRawWidgets(rawWidgets, djNamesMap, outputDir, 'auto');
}
