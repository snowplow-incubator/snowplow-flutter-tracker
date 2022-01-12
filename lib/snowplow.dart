import 'dart:async';

import 'package:flutter/services.dart';
import 'package:snowplow_flutter_tracker/configurations/configuration.dart';
import 'package:snowplow_flutter_tracker/configurations/gdpr_configuration.dart';
import 'package:snowplow_flutter_tracker/configurations/network_configuration.dart';
import 'package:snowplow_flutter_tracker/configurations/subject_configuration.dart';
import 'package:snowplow_flutter_tracker/configurations/tracker_configuration.dart';
import 'package:snowplow_flutter_tracker/events/event.dart';
import 'package:snowplow_flutter_tracker/events/self_describing.dart';
import 'package:snowplow_flutter_tracker/tracker.dart';

class Snowplow {
  static const MethodChannel _channel =
      MethodChannel('snowplow_flutter_tracker');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Tracker> createTracker(
      {required String namespace,
      required String endpoint,
      String? method,
      TrackerConfiguration? trackerConfig,
      SubjectConfiguration? subjectConfig,
      GdprConfiguration? gdprConfig}) async {
    return await createTrackerWithConfiguration(Configuration(
        namespace: namespace,
        networkConfig: NetworkConfiguration(endpoint: endpoint, method: method),
        trackerConfig: trackerConfig,
        subjectConfig: subjectConfig,
        gdprConfig: gdprConfig));
  }

  static Future<Tracker> createTrackerWithConfiguration(
      Configuration configuration) async {
    await _channel.invokeMethod('createTracker', configuration.toMap());
    return Tracker(namespace: configuration.namespace);
  }

  static Future<void> track(Event event,
      {required String tracker, List<SelfDescribing>? contexts}) async {
    var message = {
      'tracker': tracker,
      'eventData': event.toMap(),
      'contexts': contexts?.map((c) => c.toMap()).toList()
    };
    message.removeWhere((key, value) => value == null);
    await _channel.invokeMethod(event.endpoint(), message);
  }

  static Future<void> setUserId(String? userId,
      {required String tracker}) async {
    await _channel
        .invokeMethod('setUserId', {'tracker': tracker, 'userId': userId});
  }

  static Future<String?> getSessionUserId({required String tracker}) async {
    return await _channel
        .invokeMethod('getSessionUserId', {'tracker': tracker});
  }

  static Future<String?> getSessionId({required String tracker}) async {
    return await _channel.invokeMethod('getSessionId', {'tracker': tracker});
  }

  static Future<int?> getSessionIndex({required String tracker}) async {
    return await _channel.invokeMethod('getSessionIndex', {'tracker': tracker});
  }
}
