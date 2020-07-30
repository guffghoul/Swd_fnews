import 'package:flutter/material.dart';
import 'package:swdmobileapp/models/news.dart';

class CommentList extends StatefulWidget {
  final News news;
  CommentList({Key key, @required this.news}) : super(key: key);

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Scaffold(
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
          "Comments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.lightBlue,
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Flexible(
                          child: Container(
                            //color: Colors.red,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/ps5.jpg'),
                              ),
                              title: Text('haitcse130113'),
                              subtitle: Text('Nice!'),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Flexible(
                          child: Container(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/ps5.jpg'),
                              ),
                              title: Text('haitcse130113'),
                              subtitle: Text(
                                  'An so vulgar to on points wanted. Not rapturous resolving continued household northward gay. He it otherwise supported instantly. Unfeeling agreeable suffering it on smallness newspaper be. So come must time no as. Do on unpleasing possession as of unreserved. Yet joy exquisite put sometimes enjoyment perpetual now. Behind lovers eat having length horses vanity say had its.'),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Flexible(
                          child: Container(
                            //color: Colors.red,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/ps5.jpg'),
                              ),
                              title: Text('haitcse130113'),
                              subtitle: Text(
                                  'Am increasing at contrasted in favourable he considered astonished. As if made held in an shot. By it enough to valley desire do'),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1,),
              Container(
                //color: Colors.red,
                height: MediaQuery.of(context).size.height / 9.5,
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: TextFormField(
                    //controller: _commentController,
                    decoration:
                        InputDecoration(labelText: 'Write a comment...'),
                    //onFieldSubmitted: addComment,
                  ),
                  trailing: OutlineButton(
                    onPressed: () {
                      //addComment(_commentController.text);
                    },
                    borderSide: BorderSide.none,
                    child: Text("Post"),
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
