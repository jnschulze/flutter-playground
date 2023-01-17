
import 'eventchannel_win_platform_interface.dart';

class EventchannelWin {
  Future<String?> getPlatformVersion() {
    return EventchannelWinPlatform.instance.getPlatformVersion();
  }
}
