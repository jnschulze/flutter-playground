import 'package:flutter_test/flutter_test.dart';
import 'package:eventchannel_win/eventchannel_win.dart';
import 'package:eventchannel_win/eventchannel_win_platform_interface.dart';
import 'package:eventchannel_win/eventchannel_win_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEventchannelWinPlatform
    with MockPlatformInterfaceMixin
    implements EventchannelWinPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EventchannelWinPlatform initialPlatform = EventchannelWinPlatform.instance;

  test('$MethodChannelEventchannelWin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEventchannelWin>());
  });

  test('getPlatformVersion', () async {
    EventchannelWin eventchannelWinPlugin = EventchannelWin();
    MockEventchannelWinPlatform fakePlatform = MockEventchannelWinPlatform();
    EventchannelWinPlatform.instance = fakePlatform;

    expect(await eventchannelWinPlugin.getPlatformVersion(), '42');
  });
}
