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
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  List listTags = List();
  NewsTag newsTag;

  @override
  void initState() {
    super.initState();
    var tmp = DateTime.parse(widget.news.dayOfPost);
    date = DateTimeFormat.format(tmp, format: AmericanDateFormats.dayOfWeek);
    setState(() {
      listTags = widget.news.newsTag.toList();
    });
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
                              margin: EdgeInsets.only(left: 5),
                              //padding: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue[200],
                              ),
                              child: Text('Công nghệ'),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              //padding: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue[200],
                              ),
                              child: Text('Công nghệ'),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              //padding: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue[200],
                              ),
                              child: Text('Công nghệ'),
                            ),
                            // TagDetails(
                            //     tags: listTags, newsID: widget.news.newsId),
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

// class TagDetails extends StatefulWidget {
//   final newsID;
//   final List tags;
//   List<Tag> tag;

//   TagDetails({Key key, @required this.tags, @required this.newsID})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() => TagDetailsState();
// }

// class TagDetailsState extends State<TagDetails> {
//   var id;
//   @override
//   void initState() {
//     super.initState();
//     id = widget.newsID;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     Future<List<Tag>> getTag() async {
//       var response =
//           await http.get('https://fnewsapi.azurewebsites.net/api/tags/$id');
//       print(response.body);
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body) as List;
//         List<Tag> tmp = data.map((item) => Tag.fromJson(item)).toList();
//         widget.tag = tmp;
//       } else {
//         print("Failed to get data");
//       }
//     }

//     @override
//     List list = new List();
//     for (var i = 0; i < widget.tag.length; i++) {
//       //list.add(new Text(tags[i]));
//       list.add(widget.tag[i]);
//       return new Container(
//         margin: EdgeInsets.only(left: 5),
//         //padding: EdgeInsets.only(left: 5, right: 5),
//         padding: EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           color: Colors.blue[200],
//         ),
//         child: Text(list.last.toString()),
//       );
//     }
//   }
// }
