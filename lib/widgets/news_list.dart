import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/news.dart';

class NewsListItem extends StatelessWidget {
  final News news;

  NewsListItem({@required this.news});

  @override
  Widget build(BuildContext context) {
    // filter to load post where isActive = true
    if (!news.isActive) {
      return Container(
        width: 0,
        height: 0,
      );
    } else {
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 8,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.2))),
                  height: 140,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // child: Image.asset(
                    //   'assets/ps5.jpg',
                    //   fit: BoxFit.fill,
                    //   child: Image.network(
                    //     news.linkImage,
                    //     fit: BoxFit.fill,
                    // )
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: news.linkImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.orange,
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                // decoration: BoxDecoration(
                //     border:
                //         Border.all(color: Colors.purple[100], width: 2)),
                height: 140,
                width: 200,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                      alignment: Alignment.topLeft,
                      //decoration: BoxDecoration(
                      //  border: Border.all(color: Colors.grey)),
                      child: Container(
                        width: 300,
                        child: Text(
                          "Công nghệ aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.red[200],
                              backgroundColor: Colors.brown[50],
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0),
                        ),
                      ),
                      // Text(
                      //   "Công nghệ",
                      //   style: TextStyle(
                      //       backgroundColor: Colors.brown[50],
                      //       color: Colors.red[200],
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 13),
                      // ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        alignment: Alignment.topLeft,
                        // decoration: BoxDecoration(
                        //  border: Border.all(color: Colors.red)),
                        child: Text(
                          news.newsTitle,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        alignment: Alignment.topLeft,
                        // decoration: BoxDecoration(
                        //  border: Border.all(color: Colors.red)),
                        child: Text(
                          news.newsContent,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            wordSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.topLeft,
                        // decoration: BoxDecoration(
                        //  border: Border.all(color: Colors.red)),
                        child: Text(
                          news.dayOfPost,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      );
    }
  }
}
