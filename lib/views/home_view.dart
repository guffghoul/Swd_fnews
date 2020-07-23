import 'package:swdmobileapp/models/news.dart';

abstract class HomeView {
  onLoadNews(Future<List<News>> news);
}