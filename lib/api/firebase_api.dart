import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notifics_fire/notifications.dart';

import '../main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
// request permission from user
    await _firebaseMessaging.requestPermission();
    // fetch token for this device
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token : $fCMToken');
    initPushNotifications();
  }

// handle received msgs
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    //navigate to new screen when msg is received and user taps notifiction
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (_)=>
        NotificationFireScreen(message: message,),
    )
    );
  }

// initalize foreground & bckground settings
  Future<void> initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        handleMessage(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
