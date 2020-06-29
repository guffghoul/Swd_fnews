import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  String _messageText = '';

  @override
  void initState() {
    super.initState();
    // For iOS request permission first.
    _fcm.requestNotificationPermissions();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          //_messageText = "$message";
          showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        content: ListTile(
                        title: Text(message['notification']['title']),
                        subtitle: Text(message['notification']['body']),
                        ),
                        actions: <Widget>[
                        FlatButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
            );
        });
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _messageText = "$message";
        });
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        
        print("onResume: $message");
      },
    );

    // // For testing purposes print the Firebase Messaging token
    // String token = await _fcm.getToken();
    // print("FirebaseMessaging token: $token");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Message: $_messageText")
            // Text("Message: $message")
          ]),
        ),
      ),
    );
  }
}