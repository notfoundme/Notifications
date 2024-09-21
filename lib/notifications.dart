import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationFireScreen extends StatelessWidget {
  final RemoteMessage message;
  const NotificationFireScreen({super.key , required this.message});

  @override
  Widget build(BuildContext context) {
    // get the notification msg and displays
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Column(
        children: [
          Text("These are the messages from firebase"),
          Text(message.notification!.title.toString()),
          Text(message.notification!.body.toString()),
          Text(message.data.toString()),
        ],
      ),
    );
  }
}
