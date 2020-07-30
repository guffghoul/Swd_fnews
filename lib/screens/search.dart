import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/news.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:swdmobileapp/presenters/home_presenter.dart';
import 'package:swdmobileapp/widgets/news_list.dart';

class SearchScreen extends StatefulWidget {
  //final Future<List<News>> news;
  //SearchScreen({Key key, @required this.news}) : super(key: key);
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //var searchItems;
  HomePresenter _presenter;
  List<News> news_data;
  List<News> tmp = new List<News>();
  List<News> listNews = new List<News>();
  var searchValue = new TextEditingController();
  bool searched = false;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SearchBar<News>(
      //     onSearch: searchItems,
      //     onItemFound: (News news, int index) {
      //       return ListView.builder(
      //         scrollDirection: Axis.vertical,
      //         shrinkWrap: true,
      //         itemCount: searchItems == null ? 0 : searchItems.length,
      //         itemBuilder: (_, int index) {
      //           var news = searchItems[index];
      //           return NewsListItem(news: news);
      //         },
      //       );
      //     }),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255,95,109,1),
                            Color.fromRGBO(255,195,113,1)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(primaryColor: Colors.black),
                        child: TextField(
                          controller: searchValue,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) => getListFilter(),
                          cursorColor: Colors.black,
                          decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              prefixIcon: new Icon(Icons.search),
                              hintText: 'Search...'),
                        ),
                      ),
                    ),
                    // OutlineButton(
                    //   onPressed: () {

                    //     getListFilter();

                    //   },
                    //   borderSide: BorderSide.none,
                    //   child: Text("Search"),
                    // ),
                  ],
                ),
                buildList(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildList(BuildContext context) {
    if (searched == false) {
      return Container(
        width: 0,
        height: 0,
      );
    } else {
      return Container(
          height: MediaQuery.of(context).size.height / 1.15,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(color: Colors.blueGrey[100], width: 2),
          // ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listNews == null ? 0 : listNews.length,
            itemBuilder: (_, int index) {
              var news = listNews[index];
              return NewsListItem(news: news);
            },
          ));
    }
  }

  getListFilter() {
    for (var i = 0; i < news_data.length; i++) {
      if (news_data[i]
          .newsTitle
          .toLowerCase()
          .contains(searchValue.text.toLowerCase())) {
        tmp.add(news_data[i]);
      }
    }
    listNews.clear();
    for (var i = 0; i < tmp.length; i++) {
      listNews.add(tmp[i]);
    }
    tmp.clear();
    setState(() {
      searched = true;
    });
  }

  Future<List<News>> getNews() async {
    var response =
        await http.get('https://fnewsapi.azurewebsites.net/api/News');
    //print(response.body);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      List<News> news = data.map((item) => News.fromJson(item)).toList();
      setState(() {
        news_data = news;
      });
    } else {
      print("Failed to get data");
    }
  }
}
