import 'package:flutter/material.dart';

class ChannelWidget extends StatelessWidget {
 final Color color;

 ChannelWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}