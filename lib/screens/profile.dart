import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _fcm = FirebaseMessaging();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 1, top: 50),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
            ),
            child: FlatButton(
              child: Text('Subscribe to topic "Test"'),
              onPressed: () => _fcm.subscribeToTopic('Test'),
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 1, top: 50),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
            ),
            child: FlatButton(
              child: Text('Unsubscribe to topic "Test"'),
              onPressed: () => _fcm.unsubscribeFromTopic('Test'),
            ),
          ),

          Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 1, top: 50),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
            ),
            child: FlatButton(
              child: Text('Subscribe to topic "Flutter"'),
              onPressed: () => _fcm.subscribeToTopic('Flutter'),
            ),
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 1, top: 50),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
            ),
            child: FlatButton(
              child: Text('Unsubscribe to topic "Flutter"'),
              onPressed: () => _fcm.unsubscribeFromTopic('Flutter'),
            ),
          ),
        ],
      ),
    );
  }
  // GoogleSignIn _googleSignIn;
  // FirebaseUser _user;

  //  ProfileScreen(FirebaseUser user, GoogleSignIn signIn) {
  //   _user = user;
  //   _googleSignIn = signIn;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.orange,
  //       title: Text("F-News",
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold
  //           ),
  //       ),
  //       centerTitle: true,
  //       iconTheme: IconThemeData(color: Colors.white),
  //       elevation: 0,
  //     ),
  //     body: Container(
  //       color: Colors.white,
  //       padding: EdgeInsets.all(50),
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             ClipOval(
  //               child: Image.network(
  //                 _user.photoUrl,
  //                 width: 100,
  //                 height: 100,
  //                 fit: BoxFit.cover
  //               )
  //             ),
  //             SizedBox(height: 20),
  //             Text('Welcome,', textAlign: TextAlign.center),
  //             Text(_user.displayName, textAlign: TextAlign.center,
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
  //             SizedBox(height: 20),
  //             FlatButton(
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               onPressed: () {
  //                 _googleSignIn.signOut();
  //                 Navigator.pop(context, false);
  //               },
  //               color: Colors.redAccent,
  //               child: Padding(
  //                 padding: EdgeInsets.all(10),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: <Widget>[
  //                     Icon(Icons.exit_to_app, color: Colors.white),
  //                     SizedBox(width: 10),
  //                     Text('Log out of Google', style: TextStyle(color: Colors.white))
  //                   ],
  //                 )
  //               )
  //             )
  //           ],
  //         )
  //       )
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedItemColor: Colors.orange,
  //       items: [
  //         new BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           title: Text("Home")
  //         ),
  //         new BottomNavigationBarItem(
  //           icon: Icon(Icons.desktop_windows),
  //           title: Text("Channel")
  //         ),
  //         new BottomNavigationBarItem(
  //           icon: Icon(Icons.person),
  //           title: Text("Profile")
  //         )
  //       ]
  //     ),
  //   );
  // }

}
