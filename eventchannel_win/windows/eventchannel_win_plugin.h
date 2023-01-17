#ifndef FLUTTER_PLUGIN_EVENTCHANNEL_WIN_PLUGIN_H_
#define FLUTTER_PLUGIN_EVENTCHANNEL_WIN_PLUGIN_H_

#include <flutter/event_channel.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>

namespace eventchannel_win {

class EventchannelWinPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar);

  EventchannelWinPlugin(flutter::BinaryMessenger* messenger);

  virtual ~EventchannelWinPlugin();

  // Disallow copy and assign.
  EventchannelWinPlugin(const EventchannelWinPlugin&) = delete;
  EventchannelWinPlugin& operator=(const EventchannelWinPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

  std::unique_ptr<flutter::EventChannel<flutter::EncodableValue>>
      event_channel_;
  std::unique_ptr<flutter::EventSink<flutter::EncodableValue>> event_sink_;
};

}  // namespace eventchannel_win

#endif  // FLUTTER_PLUGIN_EVENTCHANNEL_WIN_PLUGIN_H_
