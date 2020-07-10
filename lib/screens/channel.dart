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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'All Channel',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Channel>>(
          future: _channels,
          builder:
              (BuildContext context, AsyncSnapshot<List<Channel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text("There was an error: ${snapshot.error}");
                if (snapshot.hasData) {
                  var channeldata = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: channeldata == null ? 0 : channeldata.length,
                      itemBuilder: (_, int index) {
                        var channels = channeldata[index];
                        return ChannelListItem(channel: channels);
                      });
                }
            }
          }),
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
