import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

mixin MessagingChannel {
  StreamSubscription? _subscription;
  List<String?> _keys = [];

  setKeys(List<String> channel) {
    _keys.addAll(channel);
  }

  startListening() {
    FirebaseMessaging.instance.getToken().then((token) {
      _subscription = FirebaseMessaging.onMessage.listen((message) {
        if (message.data.containsKey('data')) {
          final data = message.data['action'];
          if (data != null && data is String) {
            if (_keys.contains(data)) {
              onMessage(data, message.data['data']);
            }
          }
        }
      });
    });
  }

  onMessage(String channel, dynamic data);

  stopListening() {
    _subscription?.cancel();
  }
}
