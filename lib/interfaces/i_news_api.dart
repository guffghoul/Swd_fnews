import 'dart:async';
import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/models/news.dart';

abstract class INewsAPI {

  Future<List<News>> getHomeNews();

  //Future<void> bookmarkNews(int id);

  //Future<void> removeBookmark(int id);

  Future<List<Channel>> getChannels();
}