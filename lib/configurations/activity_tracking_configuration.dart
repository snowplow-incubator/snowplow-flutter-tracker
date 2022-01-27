// Copyright (c) 2022 Snowplow Analytics Ltd. All rights reserved.
//
// This program is licensed to you under the Apache License Version 2.0,
// and you may not use this file except in compliance with the Apache License Version 2.0.
// You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the Apache License Version 2.0 is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.

import 'package:flutter/foundation.dart';

/// Activity tracking monitors whether a user continues to engage with a page over time, and record how he / she digests content on the page over time.
///
/// That is accomplished using ‘page ping’ events. If activity tracking is enabled, the web page is monitored to see if a user is engaging with it. (E.g. is the tab in focus, does the mouse move over the page, does the user scroll etc.) If any of these things occur in a set period of time, a page ping event fires, and records the maximum scroll left / right and up / down in the last ping period. If there is no activity in the page (e.g. because the user is on a different tab in his / her browser), no page ping fires.
///
/// Only available on Web, ignored on mobile.
/// {@category Sessions and data model}
/// {@category Initialization and configuration}
@immutable
class ActivityTrackingConfiguration {
  /// Indicates whether activity tracking is enabled or not.
  final bool enabled;

  /// Time period from page load before the first page ping occurs, in seconds.
  final int minimumVisitLength;

  /// Number of seconds between each page ping, once they have started.
  final int heartbeatDelay;

  const ActivityTrackingConfiguration(
      {required this.minimumVisitLength,
      required this.heartbeatDelay,
      this.enabled = true});

  Map<String, Object?> toMap() {
    final conf = <String, Object?>{
      'enabled': enabled,
      'minimumVisitLength': minimumVisitLength,
      'heartbeatDelay': heartbeatDelay
    };
    conf.removeWhere((key, value) => value == null);
    return conf;
  }
}
