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

/// Determines the GDPR context that will be attached to all events sent by the tracker.
///
/// {@category Configuration}
@immutable
class GdprConfiguration {
  /// Basis for processing.
  final String basisForProcessing;

  /// ID of a GDPR basis document.
  final String documentId;

  /// Version of the document.
  final String documentVersion;

  /// Description of the document.
  final String documentDescription;

  const GdprConfiguration(
      {required this.basisForProcessing,
      required this.documentId,
      required this.documentVersion,
      required this.documentDescription});

  Map<String, Object?> toMap() {
    final conf = <String, Object?>{
      'basisForProcessing': basisForProcessing,
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentDescription': documentDescription,
    };
    conf.removeWhere((key, value) => value == null);
    return conf;
  }
}
