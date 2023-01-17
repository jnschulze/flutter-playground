#include "include/eventchannel_win/eventchannel_win_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "eventchannel_win_plugin.h"

void EventchannelWinPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  eventchannel_win::EventchannelWinPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
