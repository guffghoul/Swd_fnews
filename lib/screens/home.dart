import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swdmobileapp/screens/channel.dart';
import 'package:swdmobileapp/screens/profile.dart';
import 'package:swdmobileapp/widgets/bottomBar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen(FirebaseUser user, {Key key}) : super(key: key);

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  static GoogleSignIn _googleSignIn;
  static FirebaseUser _user;
  static List<Widget> screens = <Widget>[
    ChannelScreen(),
    HomeScreen(),
    ProfileScreen(_user, _googleSignIn),
  ];

  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_currentIndex),
      bottomNavigationBar:
          BottomBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  // GoogleSignIn _googleSignIn;
  // FirebaseUser _user;

  // HomeScreen(FirebaseUser user, GoogleSignIn signIn) {
  //   _user = user;
  //   _googleSignIn = signIn;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "F-News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      // body: Container(
      //   color: Colors.white,
      //   padding: EdgeInsets.all(50),
      //   child: Align(
      //     alignment: Alignment.center,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         ClipOval(
      //           child: Image.network(
      //             _user.photoUrl,
      //             width: 100,
      //             height: 100,
      //             fit: BoxFit.cover
      //           )
      //         ),
      //         SizedBox(height: 20),
      //         Text('Welcome,', textAlign: TextAlign.center),
      //         Text(_user.displayName, textAlign: TextAlign.center,
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      //         SizedBox(height: 20),
      //         FlatButton(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           onPressed: () {
      //             _googleSignIn.signOut();
      //             Navigator.pop(context, false);
      //           },
      //           color: Colors.redAccent,
      //           child: Padding(
      //             padding: EdgeInsets.all(10),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: <Widget>[
      //                 Icon(Icons.exit_to_app, color: Colors.white),
      //                 SizedBox(width: 10),
      //                 Text('Log out of Google', style: TextStyle(color: Colors.white))
      //               ],
      //             )
      //           )
      //         )
      //       ],
      //     )
      //   )
      // ),

      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
              color: Colors.red[50].withOpacity(0.5),
            ),
            child: Text(
              "TIN MỚI NHẤT",
              style: TextStyle(
                  color: Colors.deepOrange[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 515,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueGrey[100], width: 0.2),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //     offset: Offset(0, 3),
              //   )
              // ]
            ),
            margin: EdgeInsets.only(
              bottom: 7,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Stack(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 8,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          height: 140,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/ps5.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.orange,
                          ),
                        ),
                      ]),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        // decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: Colors.purple[100], width: 2)),
                        height: 140,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.grey)),
                              child: Text(
                                "Công nghệ",
                                style: TextStyle(
                                    backgroundColor: Colors.brown[50],
                                    color: Colors.red[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "PS5 chính thức ra mắt !",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "Tại sự kiện giới thiệu game cho PS5 vừa mới diễn ra rạng sáng nay, Sony đã giới thiệu hình dáng của chiếc máy PS5",
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  wordSpacing: -1,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "12 giờ trước",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Stack(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 8,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          height: 140,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/ps5.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Positioned(
                        //   right: 15,
                        //   top: 15,
                        //   child: Icon(
                        //     Icons.bookmark,
                        //     color: Colors.orange,
                        //   ),
                        // ),
                      ]),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        // decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: Colors.purple[100], width: 2)),
                        height: 140,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.grey)),
                              child: Text(
                                "Công nghệ",
                                style: TextStyle(
                                    backgroundColor: Colors.brown[50],
                                    color: Colors.red[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "PS5 chính thức ra mắt !",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "Tại sự kiện giới thiệu game cho PS5 vừa mới diễn ra rạng sáng nay, Sony đã giới thiệu hình dáng của chiếc máy PS5",
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  wordSpacing: -1,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "12 giờ trước",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Stack(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 8,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          height: 140,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/ps5.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.orange,
                          ),
                        ),
                      ]),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        // decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: Colors.purple[100], width: 2)),
                        height: 140,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.grey)),
                              child: Text(
                                "Công nghệ",
                                style: TextStyle(
                                    backgroundColor: Colors.brown[50],
                                    color: Colors.red[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "PS5 chính thức ra mắt !",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "Tại sự kiện giới thiệu game cho PS5 vừa mới diễn ra rạng sáng nay, Sony đã giới thiệu hình dáng của chiếc máy PS5",
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  wordSpacing: -1,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "12 giờ trước",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Stack(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 8,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          height: 140,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/ps5.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // Positioned(
                        //   right: 15,
                        //   top: 15,
                        //   child: Icon(
                        //     Icons.bookmark,
                        //     color: Colors.orange,
                        //   ),
                        // ),
                      ]),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        // decoration: BoxDecoration(
                        //     border:
                        //         Border.all(color: Colors.purple[100], width: 2)),
                        height: 140,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.grey)),
                              child: Text(
                                "Công nghệ",
                                style: TextStyle(
                                    backgroundColor: Colors.brown[50],
                                    color: Colors.red[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "PS5 chính thức ra mắt !",
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 5,
                              ),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "Tại sự kiện giới thiệu game cho PS5 vừa mới diễn ra rạng sáng nay, Sony đã giới thiệu hình dáng của chiếc máy PS5",
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  wordSpacing: -1,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topLeft,
                              //decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.red)),
                              child: Text(
                                "12 giờ trước",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow[100].withOpacity(0.5),
            ),
            height: 34,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    "First    1     2     3     4     5    Last",
                    style: TextStyle(
                        color: Colors.orange[300],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
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
