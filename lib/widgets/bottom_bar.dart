import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;
  const BottomBar({
    Key key,
    @required this.currentIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(size: 30),
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows), title: Text("Channel")),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onTap,
    );
  }
}
