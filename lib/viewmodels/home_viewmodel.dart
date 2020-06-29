import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swdmobileapp/interfaces/i_news_api.dart';
import 'package:swdmobileapp/models/news.dart';

class HomePageViewModel extends Model {
  Future<List<News>> _news;
  Future<List<News>> get news => _news;
  set news(Future<List<News>> value) {
    _news = value;
    notifyListeners();
  }

  final INewsAPI api;

  HomePageViewModel({@required this.api});

  Future<bool> setNews() async {
    news = api?.getHomeNews();
    return news != null;
  }
}