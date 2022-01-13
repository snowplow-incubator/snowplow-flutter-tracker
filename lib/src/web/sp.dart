@JS()
library snowplow;

import 'package:js/js.dart';

@JS('window.snowplow')
external void snowplow(String method,
    [dynamic arg1,
    dynamic arg2,
    dynamic arg3,
    dynamic arg4,
    dynamic arg5,
    dynamic arg6]);

@JS('addSessionContextPlugin')
external void addSessionContextPlugin(String tracker);

@JS('getSnowplowDuid')
external String? getSnowplowDuid();

@JS('getSnowplowSid')
external String? getSnowplowSid();

@JS('getSnowplowVid')
external int? getSnowplowVid();