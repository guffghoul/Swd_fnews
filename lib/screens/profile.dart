import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swdmobileapp/screens/login.dart';
import 'package:swdmobileapp/widgets/user_bookmark.dart';
import 'package:swdmobileapp/widgets/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  final GoogleSignIn googleSignIn;
  final FirebaseUser user;
  const ProfileScreen(
      {Key key, @required this.user, @required this.googleSignIn})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _fcm = FirebaseMessaging();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
          title: Text(
            "F-News",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 28,
                ),
                onPressed: () {
                  return showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Xác nhận'),
                          content: SingleChildScrollView(
                            child: Text('Bạn sắp đăng xuất. Tiếp tục?'),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                widget.googleSignIn.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPageWidget()));
                              },
                            ),
                            FlatButton(
                              child: Text('Hủy'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            // Container(
            //   height: 40,
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.only(bottom: 1, top: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.red.withOpacity(0.5),
            //   ),
            //   child: FlatButton(
            //     child: Text('Subscribe to topic "all"'),
            //     onPressed: () => _fcm.subscribeToTopic('all'),
            //   ),
            // ),
            // Container(
            //   height: 40,
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.only(bottom: 1, top: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.red.withOpacity(0.5),
            //   ),
            //   child: FlatButton(
            //     child: Text('Unsubscribe to topic "all"'),
            //     onPressed: () => _fcm.unsubscribeFromTopic('all'),
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
            Container(
              height: MediaQuery.of(context).size.height / 17,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(100, 255, 70, 109),
                    Color.fromARGB(100, 255, 195, 113)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                "Thông tin cá nhân",
                style: TextStyle(
                    color: Colors.deepOrange[400],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //color: Colors.amber[100],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: ClipOval(
                          child: Image.network(widget.user.photoUrl,
                              width: 100, height: 100, fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(widget.user.displayName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.orange,
                  indicatorWeight: 2,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.orange,
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  tabs: <Widget>[
                    Tab(
                      text: 'Bookmark',
                      icon: Icon(Icons.collections_bookmark),
                    ),
                    Tab(
                      text: 'Hồ sơ',
                      icon: Icon(Icons.account_box),
                    ),
                  ]),
            ),
            Container(
                color: Colors.amber[50],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.35,
                alignment: Alignment.center,
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    UserBookmarkWidget(),
                    UserProfileWidget()
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
