import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swdmobileapp/screens/login.dart';

class ProfileScreen extends StatelessWidget {
  final GoogleSignIn googleSignIn;
  final FirebaseUser user;
  const ProfileScreen(
      {Key key, @required this.user, @required this.googleSignIn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _fcm = FirebaseMessaging();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 95, 109, 1),
                Color.fromRGBO(255, 195, 113, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        //backgroundColor: Colors.orange,
        title: Text(
          "F-News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //   height: 40,
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.only(bottom: 1, top: 50),
          //   decoration: BoxDecoration(
          //     color: Colors.red.withOpacity(0.5),
          //   ),
          //   child: FlatButton(
          //     child: Text('Subscribe to topic "Test"'),
          //     onPressed: () => _fcm.subscribeToTopic('Test'),
          //   ),
          // ),
          // Container(
          //   height: 40,
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.only(bottom: 1, top: 50),
          //   decoration: BoxDecoration(
          //     color: Colors.red.withOpacity(0.5),
          //   ),
          //   child: FlatButton(
          //     child: Text('Unsubscribe to topic "Test"'),
          //     onPressed: () => _fcm.unsubscribeFromTopic('Test'),
          //   ),
          // ),

          // Container(
          //   height: 40,
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.only(bottom: 1, top: 50),
          //   decoration: BoxDecoration(
          //     color: Colors.blue.withOpacity(0.5),
          //   ),
          //   child: FlatButton(
          //     child: Text('Subscribe to topic "Flutter"'),
          //     onPressed: () => _fcm.subscribeToTopic('Flutter'),
          //   ),
          // ),
          // Container(
          //   height: 40,
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.only(bottom: 1, top: 50),
          //   decoration: BoxDecoration(
          //     color: Colors.blue.withOpacity(0.5),
          //   ),
          //   child: FlatButton(
          //     child: Text('Unsubscribe to topic "Flutter"'),
          //     onPressed: () => _fcm.unsubscribeFromTopic('Flutter'),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ClipOval(
                  child: Image.network(user.photoUrl,
                      width: 100, height: 100, fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(user.displayName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: FlatButton(
                  child: Text('Logout'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.red[400],
                  onPressed: () {
                    googleSignIn.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPageWidget()));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
