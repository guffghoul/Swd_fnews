import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/screens/channel_detail.dart';

class ChannelListItem extends StatefulWidget {
  final Channel channel;

  ChannelListItem({@required this.channel});

  @override
  State<StatefulWidget> createState() => _ChannelListState(channel);
}

class _ChannelListState extends State<ChannelListItem> {
  Channel _channel;

  _ChannelListState(Channel channel) {
    _channel = channel;
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 3;
    if (!_channel.isActive) {
      return Container(
        width: 0,
        height: 0,
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChannelDetails(id: _channel.channelId)));
        },
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: imageWidth,
                    width: imageWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/no-image.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              _channel.channelName,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              _channel.channelName,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Last Post: 13/06/2020",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            //color: Colors.amber,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[350],
                            ),
                            child: Text(
                              "SUBSCRIBE",
                              style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          // IconButton(
                          //   icon: Icon(Icons.check_box_outline_blank),
                          //   onPressed: () {},
                          //   // iconSize: 20,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      );
    }
  }
}
