import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swdmobileapp/screens/home.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isUserSignedIn = false;
  bool isSchoolMail = false;

  @override
  void initState() {
    super.initState();

    checkIfUserIsSignedIn();
  }

  // void errorMsg(bool flag) {
  //   if (flag == false){

  //   }
  //   setState(() {
  //       isUserSignedIn = flag;
  //     });
  // }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
        body: Container(
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      onGoogleSignIn(context);
                    },
                    color: isUserSignedIn ? Colors.green : Colors.blueAccent,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                                isUserSignedIn
                                    ? 'You\'re logged in with Google'
                                    : 'Login with Google',
                                style: TextStyle(color: Colors.white))
                          ],
                        ))))));
  }

  Future<FirebaseUser> _handleSignIn() async {
    FirebaseUser user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;

      userSignedIn = await _googleSignIn.isSignedIn();

      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();
    bool check = false;
    if (check == RegExp("[a-z][a-z0-9_\.]{5,32}@[fpt]+\.[edu]+\.[vn]").hasMatch(user.email)) {
      _googleSignIn.signOut();
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: Text('Your email is not authorize to access this app!'),
        duration: Duration(seconds: 3),
      ));
      Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginPageWidget()));
      });
    } else {
      var userSignedIn = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RootScreen(user : user, googleSignIn: _googleSignIn)),
                //RootScreen()),
      );

      setState(() {
        isUserSignedIn = userSignedIn == null ? true : false;
      });
    }
  }
}
