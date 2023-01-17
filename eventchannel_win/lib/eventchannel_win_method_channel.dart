import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'eventchannel_win_platform_interface.dart';

/// An implementation of [EventchannelWinPlatform] that uses method channels.
class MethodChannelEventchannelWin extends EventchannelWinPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('eventchannel_win');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
