import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swdmobileapp/models/news.dart';
import 'package:swdmobileapp/screens/channel.dart';
import 'package:swdmobileapp/screens/profile.dart';
import 'package:swdmobileapp/services/project_api.dart';
import 'package:swdmobileapp/viewmodels/home_viewmodel.dart';
import 'package:swdmobileapp/widgets/bottom_bar.dart';
import 'package:swdmobileapp/widgets/newslist.dart';
import 'package:swdmobileapp/widgets/no_internet.dart';

final HomePageViewModel homePageViewModel = HomePageViewModel(api: ProjectApi());

class RootScreen extends StatefulWidget {
  //const RootScreen(FirebaseUser user, {Key key}) : super(key: key);
  final HomePageViewModel viewModel;

  RootScreen({Key key,@required this.viewModel}) : super(key: key);

  @override
  RootScreenState createState() => RootScreenState(viewModel);
}

class RootScreenState extends State<RootScreen>{
  static GoogleSignIn _googleSignIn;
  static FirebaseUser _user;
  static HomePageViewModel _homePageViewModel;

  RootScreenState(HomePageViewModel viewModel){
    _homePageViewModel = viewModel;
  }

  static List<Widget> screens = <Widget>[
    ChannelScreen(),
    HomeScreen(viewModel: _homePageViewModel,),
    //ProfileScreen(_user, _googleSignIn),
    ProfileScreen(),
  ];

  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_currentIndex),
      bottomNavigationBar:
          BottomBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final HomePageViewModel viewModel;

  HomeScreen({Key key, @required this.viewModel}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  Future loadData() async {
    await widget.viewModel.setNews();
  }

  @override
  void initState(){
    super.initState();
    loadData();
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
      body: ScopedModel<HomePageViewModel>(
        model: widget.viewModel,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 1),
              decoration: BoxDecoration(
                color: Colors.red[50].withOpacity(0.5),
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
              height: 515,
              //for emulator debug
              // height: 600,
              alignment: Alignment.center,
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
              child: SingleChildScrollView(
                child: ScopedModelDescendant<HomePageViewModel>(
                  builder: (context, child, model) {
                    return FutureBuilder<List<News>>(
                      future: model.news,
                      builder: (_, AsyncSnapshot<List<News>> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(child: const CircularProgressIndicator());
                          case ConnectionState.done:
                          if (snapshot.hasData) {
                            var newsdata = snapshot.data;
                            return ListView.builder(
                              itemCount: newsdata == null ? 0 : newsdata.length,
                              itemBuilder: (_, int index) {
                                var news = newsdata[index];
                                return NewsListItem(news: news);
                              },
                            );
                          } else if (snapshot.hasError) {
                            return NoInternetConnection(
                              action: () async {
                                await model.setNews();
                              },
                            );
                          }
                        }
                      },
                    );
                  }
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow[100].withOpacity(0.5),
              ),
              height: 34,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      "First    1     2     3     4     5    Last",
                      style: TextStyle(
                          color: Colors.orange[300],
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




