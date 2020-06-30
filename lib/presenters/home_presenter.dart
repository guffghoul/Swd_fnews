import 'package:flutter/cupertino.dart';
import 'package:swdmobileapp/interfaces/i_news_api.dart';
import 'package:swdmobileapp/models/news.dart';
import 'package:swdmobileapp/presenters/base_presenter.dart';
import 'package:swdmobileapp/views/home_view.dart';

class HomePresenter extends BasePresenter<HomeView> {
  List<News> news;
  final INewsAPI api;

  HomePresenter({@required this.api});

  Future getNews() async {
    checkViewAttached();
    var data = api?.getHomeNews();
    news = data as List<News>;
    if (news != null) {
      isViewAttached ? getView().onLoadNews(news) : null;
    } else {
      return debugPrint("News is empty!");
    }
  }
}
