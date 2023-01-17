import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'eventchannel_win_method_channel.dart';

abstract class EventchannelWinPlatform extends PlatformInterface {
  /// Constructs a EventchannelWinPlatform.
  EventchannelWinPlatform() : super(token: _token);

  static final Object _token = Object();

  static EventchannelWinPlatform _instance = MethodChannelEventchannelWin();

  /// The default instance of [EventchannelWinPlatform] to use.
  ///
  /// Defaults to [MethodChannelEventchannelWin].
  static EventchannelWinPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EventchannelWinPlatform] when
  /// they register themselves.
  static set instance(EventchannelWinPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
