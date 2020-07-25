import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/news.dart';
import 'package:date_time_format/date_time_format.dart';

class NewsDetails extends StatefulWidget {
  final News news;
  NewsDetails({Key key, @required this.news}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  var date;

  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "F-News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
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
                      // margin: EdgeInsets.only(
                      //   top: 10,
                      //   left: 80,
                      //   right: 8,
                      //   bottom: 10,
                      // ),
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
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.orange,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
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
                          margin: EdgeInsets.only(left: 6),
                          //padding: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[200],
                          ),
                          child: Text('Công nghệ'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          //padding: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[200],
                          ),
                          child: Text('Thông báo'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          //padding: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[200],
                          ),
                          child: Text('Công nghệ'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          //padding: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[200],
                          ),
                          child: Text('Công nghệ'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          //padding: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[200],
                          ),
                          child: Text('Công nghệ'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          //padding: EdgeInsets.only(left: 5, right: 5),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[200],
                          ),
                          child: Text('Công nghệ'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width / 0.5,
              //     height: MediaQuery.of(context).size.height / 6,
              //     decoration:
              //         BoxDecoration(border: Border.all(color: Colors.grey)),
              //     child: Text(
              //       "comment",
              //       //textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 19,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
                child: InkWell(
                  onTap: () => {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 0.5,
                    height: MediaQuery.of(context).size.height / 21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.red[200],
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
    );
  }
}