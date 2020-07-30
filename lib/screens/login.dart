import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swdmobileapp/models/user.dart';
import 'package:swdmobileapp/screens/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  List<User> users = new List<User>();
  List<User> tmp = new List<User>();
  String msg;
  bool checkUserExisted = false;

  Future<List<User>> getUsers() async {
    var response = await http.get(
        'https://fnewsapi.azurewebsites.net/api/users',
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      //print(response.body);
      tmp = data.map((e) => User.fromJson(e)).toList();
    } else {
      print('Failed to get data');
    }

    setState(() {
      users = tmp;
    });
  }

  Future<String> createUser(User register) async {
    var response = await http.post(
        'https://fnewsapi.azurewebsites.net/api/users/',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: JsonEncoder().convert(register.toJson()));
    //print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "Create Success!";
    } else {
      print(response.statusCode);
      return "Failed to create!";
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfUserIsSignedIn();
    getUsers();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10), child: ClipRRect(
                child: Image.asset('assets/fpt-logo.png', width: 200, height: 200, fit: BoxFit.fitWidth,),
              ),),
              Container(
                  padding:
                      EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 15),
                  child: Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            onGoogleSignIn(context);
                          },
                          color:
                              isUserSignedIn ? Colors.green : Colors.blueAccent,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.account_circle,
                                          color: Colors.white),
                                      SizedBox(width: 10),
                                      Text(
                                          isUserSignedIn
                                              ? 'You\'re logged in with Google'
                                              : 'Login with Google',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  )),
                            ],
                          )))),
              isUserSignedIn
                  ? GestureDetector(
                      onTap: () {
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
                                _googleSignIn.signOut();
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
                      },
                      child: Text(
                        'Login with different account',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    )
            ],
          )),
    );
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
    if (check ==
        RegExp("[a-z][a-z0-9_\.]{5,32}@[fpt]+\.[edu]+\.[vn]")
            .hasMatch(user.email)) {
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
      for (var i = 0; i < users.length; i++) {
        if (user.email.contains(users[i].email)) {
          print('email is already in db');
          //checkUserExisted = true;
          var userSignedIn = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RootScreen(user: user, googleSignIn: _googleSignIn, dbUser: users[i],)),
            //RootScreen()),
          );

          setState(() {
            isUserSignedIn = userSignedIn == null ? true : false;
          });
        } else {
          print('email not in db');
          //checkUserExisted = false;
        }
      }
      User newUser = new User();
      newUser.userId = 1;
      newUser.email = user.email;
      newUser.groupId = null;
      newUser.isAdmin = false;
      newUser.isActive = true;
      newUser.password = "123";
      msg = await createUser(newUser);
      print(msg);

      var userSignedIn = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RootScreen(user: user, googleSignIn: _googleSignIn, dbUser: newUser,)),
        //RootScreen()),
      );

      setState(() {
        isUserSignedIn = userSignedIn == null ? true : false;
      });
    }
  }
}
