import 'package:swdmobileapp/models/news.dart';

abstract class INewsAPI {
  //Future<News> getNews(int id);

  Future<List<News>> getHomeNews();

  //Future<void> bookmarkNews(int id);

  //Future<void> removeBookmark(int id);
}