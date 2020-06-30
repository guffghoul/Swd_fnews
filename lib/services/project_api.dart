import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swdmobileapp/interfaces/i_news_api.dart';
import 'package:swdmobileapp/models/news.dart';


class ProjectApi implements INewsAPI{
  final _baseUrl = 'https://fnewsdemo.azurewebsites.net/api';
  http.Client _client = http.Client();

  set client(http.Client value) => _client = value;

  static final ProjectApi _internal = ProjectApi._internal;
  
  factory ProjectApi() => _internal;
  
  ProjectApi.internal();

  @override
  Future<List<News>> getHomeNews() async{
    var response = await _client.get('$_baseUrl/News');

    //var news = List<News>();

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // List<dynamic> newsData = data['results'];
       List<News> news = data.map((e) => News.fromJson(data)).toList();

      // for (var data in data) {
      //   news.add(News.fromJson(data));
      // }
      
      return news;
    } else {
      throw Exception('Failed to get data');
    }
  }

  

  
  
}