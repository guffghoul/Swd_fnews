import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/presenters/channel_presenter.dart';
import 'package:swdmobileapp/views/channel_view.dart';
import 'package:swdmobileapp/widgets/channel_list.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> implements ChannelView {
  Future<List<Channel>> _channels;
  ChannelPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = new ChannelPresenter();
    _presenter.attachView(this);
    _presenter.getChannels();
  }

  @override
  Widget build(BuildContext context) {
    //double imageWidth = MediaQuery.of(context).size.width / 3;
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
                    "Nhóm Kênh",
                    style: TextStyle(
                        color: Colors.deepOrange[400],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueGrey[100], width: 0.2),
                    
                  ),
                  margin: EdgeInsets.only(
                    bottom: 7,
                  ),
                  child: FutureBuilder<List<Channel>>(
                      future: _channels,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Channel>> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(
                                child: const CircularProgressIndicator());
                          case ConnectionState.done:
                            if (snapshot.hasError)
                              return Text(
                                  "There was an error: ${snapshot.error}");
                            if (snapshot.hasData) {
                              var channeldata = snapshot.data;
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: channeldata == null
                                      ? 0
                                      : channeldata.length,
                                  itemBuilder: (_, int index) {
                                    var channels = channeldata[index];
                                    return ChannelListItem(channel: channels);
                                  });
                            }
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  onLoadChannels(Future<List<Channel>> channels) {
    _channels = channels;
  }

  @override
  void dispose() {
    super.dispose();
    if (_presenter != null) {
      _presenter.detachView();
    }
  }
}
