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

/// Configuration of the collector network endpoint.
///
/// {@category Initialization and configuration}
@immutable
class NetworkConfiguration {
  /// Endpoint of the collector, e.g. `http://localhost:9090`
  final String endpoint;

  /// Choice of GET or POST (default) HTTP method used to send events to the collector.
  final Method? method;

  const NetworkConfiguration({required this.endpoint, this.method});

  Map<String, Object?> toMap() {
    final conf = <String, Object?>{
      'endpoint': endpoint,
      'method': method?.name
    };
    conf.removeWhere((key, value) => value == null);
    return conf;
  }
}

enum Method { get, post }
