import 'package:flutter/material.dart';

class UserProfileWidget extends StatefulWidget {
  UserProfileWidget({Key key}) : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("Profile"),
          )
        ],
      ),
    );
  }
}
