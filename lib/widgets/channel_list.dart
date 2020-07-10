import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/channel.dart';

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
      return Column(
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
                      image: AssetImage('assets/vovinam.jpg'),
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
                            "Total subscribers: 700",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Total Post: 45",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "SUBSCRIBE",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.check_box_outline_blank),
                          onPressed: () {},
                          // iconSize: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
