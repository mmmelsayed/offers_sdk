import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:offers_sdk/offers_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('offers_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await OffersSdk.platformVersion, '42');
  // });
}
