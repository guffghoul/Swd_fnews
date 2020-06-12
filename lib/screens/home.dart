import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swdmobileapp/screens/channel.dart';
import 'package:swdmobileapp/screens/profile.dart';

class WelcomeUserWidget extends StatelessWidget {

  GoogleSignIn _googleSignIn;
  FirebaseUser _user;

  WelcomeUserWidget(FirebaseUser user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("F-News",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
            ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  _user.photoUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover
                )
              ),
              SizedBox(height: 20),
              Text('Welcome,', textAlign: TextAlign.center),
              Text(_user.displayName, textAlign: TextAlign.center, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(height: 20),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  _googleSignIn.signOut();
                  Navigator.pop(context, false);
                },
                color: Colors.redAccent,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.exit_to_app, color: Colors.white),
                      SizedBox(width: 10),
                      Text('Log out of Google', style: TextStyle(color: Colors.white))
                    ],
                  )
                )
              )
            ],
          )
        )
      ),

    // body: Container(
    //   margin: EdgeInsets.only(
    //     top: 10,
    //     left: 10,
    //     right: 10,
    //   ),
    //   child: Column(
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Container(
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.blueGrey[100],
    //                 width: 2
    //               )
    //             ),
    //             height: 170,
    //             width: 165,
    //             child: Image.asset("assets/news.png"),
    //           ),
    //           Container(
    //              decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.blueGrey[100],
    //                 width: 2
    //               )
    //             ),
    //             height: 170,
    //             width: 205,
    //             child: Text("Tag Placeholder",
    //             style: TextStyle(
    //                 backgroundColor: Colors.brown[50],
    //                 color: Colors.red[200],
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             padding: EdgeInsets.only(
    //               top: 5,
    //             ),
    //           )
    //         ],
    //       ),

    //       Row(
    //         children: <Widget>[
    //           Container(
    //             margin: EdgeInsets.only(
    //               top: 10,
    //             ),
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.blueGrey[100],
    //                 width: 2
    //               )
    //             ),
    //             height: 170,
    //             width: 165,
    //             child: Image.asset("assets/news.png"),
    //           ),
    //           Container(
    //             margin: EdgeInsets.only(
    //               top: 10,
    //             ),
    //              decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.blueGrey[100],
    //                 width: 2
    //               )
    //             ),
    //             height: 170,
    //             width: 205,
    //             child: Text("Tag Placeholder",
    //             style: TextStyle(
    //                 backgroundColor: Colors.brown[50],
    //                 color: Colors.red[200],
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             padding: EdgeInsets.only(
    //               top: 5,
    //             ),
    //           )
    //         ],
    //       ),

    //       Row(
    //         children: <Widget>[
    //           Container(
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.blueGrey[100],
    //                 width: 2
    //               )
    //             ),
    //             height: 170,
    //             width: 165,
    //             child: Image.asset("assets/news.png"),
    //           ),
    //           Container(
    //              decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.blueGrey[100],
    //                 width: 2
    //               )
    //             ),
    //             height: 170,
    //             width: 205,
    //             child: Text("Tag Placeholder",
    //             style: TextStyle(
    //                 backgroundColor: Colors.brown[50],
    //                 color: Colors.red[200],
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             padding: EdgeInsets.only(
    //               top: 5,
    //             ),
    //           )
    //         ],
    //       ),
          
    //     ],
    //   ),
    // ),

      bottomNavigationBar: BottomNavigationBar( 
        selectedItemColor: Colors.orange,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows),
            title: Text("Channel")
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile")
          )
        ]
      ),
    );
  }
}

// GoogleSignIn _googleSignIn;
// FirebaseUser _user;

// class HomeWidget extends StatefulWidget {
  

//   HomeWidget(FirebaseUser user, GoogleSignIn signIn){
//     _user = user;
//     _googleSignIn = signIn;
//   }

//   @override
//   State<StatefulWidget> createState() {
//     return _HomeState(_user, _googleSignIn);
//   }
// }

// class _HomeState extends State<HomeWidget> {

//   _HomeState(FirebaseUser user, GoogleSignIn signIn){
//     _user = user;
//     _googleSignIn = signIn;
//   }

//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     HomeWidget(_user, _googleSignIn),
//     ProfileWidget(_user, _googleSignIn),
//     ChannelWidget(Colors.green[100])
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar( 
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.orange,
//         items: [
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text("Home")
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.desktop_windows),
//             title: Text("Channel")
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text("Profile")
//           )
//         ]
//       ),
//     );
//   }

//   void onTabTapped(int index){
//       setState(() {
//         _currentIndex = index;
//       });
//     }

// }