import 'package:flutter/material.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width / 3;
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
      body: SingleChildScrollView(
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
                              "CLB Vovinam",
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
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
                        image: AssetImage('assets/library.jpg'),
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
                              "Phòng Thư Viện",
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
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
                        image: AssetImage('assets/fpt.png'),
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
                              "FPT news",
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
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
                        image: AssetImage('assets/ctsv.jpg'),
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
                              "Phòng CTSV",
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
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
                        image: AssetImage('assets/ctsv.jpg'),
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
                              "Phòng CTSV",
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
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
                        image: AssetImage('assets/ctsv.jpg'),
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
                              "Phòng CTSV",
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
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Total Post: 45",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
        ),
      ),
    );
  }
}
