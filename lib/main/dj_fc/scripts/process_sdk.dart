import 'package:dj/main/main.dart';

const String FLUTTER_SDK_LOCATION = 'D:\\src\\flutter';

void main() {
  var flutterSdkWidgetProcessor = FlutterSdkWidgetProcessor(
    sdkLocation: FLUTTER_SDK_LOCATION,
  );

  var rawWidgets = flutterSdkWidgetProcessor.process();

  var djNamesMap = getDjNamesMap(rawWidgets);

  var widgetFileDjs = <FileDj>[];

  rawWidgets.forEach((rawWidget) {
    var widgetFileDj = rawWidget.toWidgetDjFileDj(djNamesMap);
    if (widgetFileDj != null) {
      widgetFileDjs.add(widgetFileDj);
    } else {
      print('No FileDj for ${rawWidget.name} @ ${rawWidget.originFilePath}');
    }
  });

  print('FieldDj.unKnownDataTypes ${RawWidgetDj.unKnownDataTypes}');
}
