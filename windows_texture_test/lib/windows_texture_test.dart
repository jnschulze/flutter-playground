import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final MethodChannel _channel = const MethodChannel('windows_texture_test');

class PlayerValue {
  PlayerValue({
    this.isInitialized,
  });

  final bool isInitialized;

  PlayerValue copyWith({
    bool isInitialized,
  }) {
    return PlayerValue(
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }

  PlayerValue.uninitialized()
      : this(
          isInitialized: false,
        );
}

class PlayerController extends ValueNotifier<PlayerValue> {
  Completer<void> _creatingCompleter;
  int _textureId;
  bool _isDisposed = false;

  PlayerController() : super(PlayerValue.uninitialized());

  Future<void> initialize() async {
    if (_isDisposed) {
      return Future<void>.value();
    }
    try {
      _creatingCompleter = Completer<void>();
      final Map<String, dynamic> reply =
          await _channel.invokeMapMethod<String, dynamic>(
        'initialize',
        <String, dynamic>{},
      );
      _textureId = reply['textureId'];

      value = value.copyWith(isInitialized: true);
    } on PlatformException catch (e) {}

    _creatingCompleter.complete();
    return _creatingCompleter.future;
  }
}

class PlayerView extends StatelessWidget {
  const PlayerView(this.controller);

  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Texture(textureId: controller._textureId)
        : Container();
  }
}
