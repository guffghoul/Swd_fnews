import 'package:flutter/material.dart';

class UserBookmarkWidget extends StatefulWidget {
  UserBookmarkWidget({Key key}) : super(key: key);

  @override
  _UserBookmarkWidgetState createState() => _UserBookmarkWidgetState();
}

class _UserBookmarkWidgetState extends State<UserBookmarkWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("Bookmark"),
          )
        ],
      ),
    );
  }
}
