import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swdmobileapp/interfaces/i_news_api.dart';
import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/models/news.dart';

class ProjectApi implements INewsAPI {
  final _baseUrl = 'https://fnewsapi.azurewebsites.net/api';

  @override
  Future<List<News>> getHomeNews() async {
    var response = await http.get('$_baseUrl/News');
    //print(response.body);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      List<News> news = data.map((item) => News.fromJson(item)).toList();
      return news;
    } else {
      print("Failed to get data");
      //throw Exception('Failed to get data');
    }
  }

  Future<List<Channel>> getChannels() async {
    var response = await http.get('$_baseUrl/Channels');

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      //debugPrint(response.body);
      List<Channel> channels = data.map((e) => Channel.fromJson(e)).toList();
      return channels;
    } else {
      throw Exception('Failed to get data');
    }
  }
}