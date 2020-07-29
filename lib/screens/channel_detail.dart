import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/news.dart';
import 'package:swdmobileapp/presenters/home_presenter.dart';
import 'package:swdmobileapp/views/home_view.dart';
import 'package:swdmobileapp/widgets/channel_news_list.dart';
import 'package:swdmobileapp/widgets/news_list.dart';
import 'package:swdmobileapp/widgets/no_internet.dart';

class ChannelDetails extends StatefulWidget {
  final int id;

  ChannelDetails({Key key, @required this.id}) : super(key: key);

  @override
  _ChannelDetailsState createState() => _ChannelDetailsState();
}

class _ChannelDetailsState extends State<ChannelDetails> implements HomeView{
  Future<List<News>> _news;
  HomePresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = new HomePresenter();
    _presenter.attachView(this);
    _presenter.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "TIN MỚI NHẤT",
                  style: TextStyle(
                      color: Colors.deepOrange[400],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                //for mobile debug
                height: MediaQuery.of(context).size.height / 1.3,
                //for emulator debug
                // height: 600,
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey[100], width: 0.2),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3),
                  //   )
                  // ]
                ),
                margin: EdgeInsets.only(
                  bottom: 7,
                ),
                child: FutureBuilder<List<News>>(
                  future: _news,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<News>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(child: const CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return Text("There was an error: ${snapshot.error}");
                        if (snapshot.hasData) {
                          var newsdata = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: newsdata == null ? 0 : newsdata.length,
                            itemBuilder: (_, int index) {
                              var news = newsdata[index];
                              return ChannelNewsListItem(news: news, id: widget.id);
                            },
                          );
                        } else if (snapshot.hasError) {
                          return NoInternetConnection(
                            action: () async {
                              await onLoadNews(_news);
                            },
                          );
                        }
                    }
                    // if (snapshot.hasData) {
                    //   List<News> news = snapshot.data;

                    //   return Flexible(
                    //     child: ListView(
                    //         scrollDirection: Axis.vertical,
                    //         shrinkWrap: true,
                    //         children: news
                    //             .map(
                    //               (News newsItem) => ListTile(
                    //                 title: Text(newsItem.newsTitle),
                    //               ),
                    //             )
                    //             .toList()),
                    //   );
                    // }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  onLoadNews(Future<List<News>> news) {
    setState(() {
      _news = news;
    });
  }
}