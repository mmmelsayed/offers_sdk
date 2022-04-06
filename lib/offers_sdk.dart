
import 'dart:async';

import 'package:flutter/services.dart';

class OffersSdk {
  static const MethodChannel _channel = MethodChannel('offers_sdk');

  static Future<String> getAContact() async {
    final String contact = await _channel.invokeMethod('getAContact');
    return contact;
  }
}
