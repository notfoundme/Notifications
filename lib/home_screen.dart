import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _showNotification() async {
    //  make a channel
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
            "com.example.notifics_fire", "User Notifications",
            channelDescription: "This is shown when clicked ",
            importance: Importance.max,
            priority: Priority.high,
            colorized: true,
            color: Colors.red,
            styleInformation: BigTextStyleInformation(
                "Hi there, This is msg from Garima Bhattarai . She is sending you hampers and gifts ,",
                contentTitle: "SP sent you a msg",
                htmlFormatContent: true,
                htmlFormatTitle: true),
            largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"));
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(),
    );

    // show the notifications.

    await flutterLocalNotificationsPlugin.show(0, "Hello Garima",
        "Wanna be a software engineer at google? ", notificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notific"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                _showNotification();
              },
              child: const Text("Show Notifications")),
          const SizedBox(),
          TextButton(
              onPressed: () {}, child: const Text("Remove Notifications")),
        ],
      ),
    );
  }
}
