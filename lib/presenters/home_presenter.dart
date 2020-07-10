import 'dart:async';
import 'package:swdmobileapp/models/news.dart';
import 'package:swdmobileapp/presenters/base_presenter.dart';
import 'package:swdmobileapp/services/project_api.dart';
import 'package:swdmobileapp/views/home_view.dart';

class HomePresenter extends BasePresenter<HomeView> {   
  final ProjectApi apiScv = new ProjectApi();

  Future<List<News>> getNews() async {
    checkViewAttached();
    Future<List<News>> news = apiScv?.getHomeNews();
    //print(news[0].newsTitle);
    if (news != null) {
      isViewAttached ? getView().onLoadNews(news) : null;
    } else {
      //return debugPrint("News is empty!");
      throw Exception('News is empty!');
    }
  }
}
