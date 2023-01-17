import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eventchannel_win/eventchannel_win_method_channel.dart';

void main() {
  MethodChannelEventchannelWin platform = MethodChannelEventchannelWin();
  const MethodChannel channel = MethodChannel('eventchannel_win');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
