import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
            print("onMessage: $message");
            // showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //             content: ListTile(
            //             title: Text(message['notification']['title']),
            //             subtitle: Text(message['notification']['body']),
            //             ),
            //             actions: <Widget>[
            //             FlatButton(
            //                 child: Text('Ok'),
            //                 onPressed: () => Navigator.of(context).pop(),
            //             ),
            //         ],
            //     ),
            // );
        },
        onLaunch: (Map<String, dynamic> message) async {
            print("onLaunch: $message");
            // TODO optional
        },
        onResume: (Map<String, dynamic> message) async {
            print("onResume: $message");
            // TODO optional
        },
      );

      // // For testing purposes print the Firebase Messaging token
      // String token = await _firebaseMessaging.getToken();
      // print("FirebaseMessaging token: $token");
      
      _initialized = true;
    }
  }
}