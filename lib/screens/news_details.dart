import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/news.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:swdmobileapp/models/newstag.dart';
import 'package:swdmobileapp/models/tag.dart';
import 'package:swdmobileapp/screens/comment_list.dart';
import 'package:http/http.dart' as http;

class NewsDetails extends StatefulWidget {
  final News news;

  NewsDetails({Key key, @required this.news}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  var date;
  Color isBookmarked;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Tag> tag = new List<Tag>();

  @override
  void initState() {
    super.initState();
    //print(widget.news);
    for (var i = 0; i < widget.news.newsTag.length; i++) {
      tag.add(widget.news.newsTag[i].tag);
      //print(tag.last);
    }

    var tmp = DateTime.parse(widget.news.dayOfPost);
    date = DateTimeFormat.format(tmp, format: AmericanDateFormats.dayOfWeek);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        // /top: 8,
                        bottom: 5),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     border:
                          //         Border.all(color: Colors.grey.withOpacity(0.2))),
                          height: MediaQuery.of(context).size.height / 2.8,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              //borderRadius: BorderRadius.circular(10),
                              child: widget.news.linkImage != null
                                  ? CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      imageUrl: widget.news.linkImage,
                                      fit: BoxFit.fill,
                                    )
                                  : Icon(Icons.error)),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: IconButton(
                            icon: Icon(Icons.bookmark),
                            onPressed: () {
                              setState(() {
                                if (isBookmarked == Colors.white) {
                                  isBookmarked = Colors.orange;
                                } else {
                                  isBookmarked = Colors.white;
                                }
                              });
                            },
                            iconSize: 32,
                            color: isBookmarked,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 5),
                    child: Flexible(
                      child: Container(
                        //height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.width / 0.5,
                        // decoration:
                        //     BoxDecoration(border: Border.all(color: Colors.grey)),
                        child: Text(
                          widget.news.newsTitle,
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.width / 0.5,
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Text(
                        "Date of post: $date",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 0.5,
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Text(
                        widget.news.newsContent,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.width / 0.5,
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Tags: ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Container(
                                child: tag.isEmpty
                                    ? Container(
                                        width: 0,
                                        height: 0,
                                      )
                                    : TagDetails(tags: tag)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 5),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentList())),
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 0.5,
                        height: MediaQuery.of(context).size.height / 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(17, 153, 142, 1),
                              Color.fromRGBO(56, 239, 125, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Text(
                          "Comment",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 19, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TagDetails extends StatelessWidget {
  final List<Tag> tags;

  TagDetails({
    Key key,
    @required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tagName = new List();
    List<Widget> listWidget = new List();
    for (var i = 0; i < tags.length; i++) {
      tagName.add(tags[i].tagName);
      listWidget.add(new Container(
        margin: EdgeInsets.only(left: 5),
        //padding: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue[200],
        ),
        child: Text(tagName.last.toString()),
      ));
    }
    return new Row(children: listWidget);
  }
}
