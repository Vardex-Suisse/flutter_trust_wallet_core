import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';

void main() {
  const MethodChannel channel = MethodChannel('trust_wallet_core');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TrustWalletCore.platformVersion, '42');
  });
}
