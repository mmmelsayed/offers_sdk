
import 'dart:async';

import 'package:flutter/services.dart';

class OffersSdk {
  static const MethodChannel _channel = MethodChannel('offers_sdk');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
