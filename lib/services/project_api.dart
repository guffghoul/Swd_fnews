import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swdmobileapp/interfaces/i_news_api.dart';
import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/models/news.dart';

class ProjectApi implements INewsAPI {
  final _baseUrl = 'https://fnewsdemo.azurewebsites.net/api';
  // var _session = TimeOfDay.now();
  

  // http.Client _client = http.Client();

  // set client(http.Client value) => _client = value;

  // static final ProjectApi _internal = ProjectApi._internal;

  // factory ProjectApi() => _internal;

  // ProjectApi.internal();

  @override
  Future<List<News>> getHomeNews() async {
    // var _sessionTimeout = TimeOfDay.now();
    // double test = 15.9;
    // double session = _session.hour.toDouble() + (_session.minute.toDouble() / 60);
    // double sessionTimeout = _sessionTimeout.hour.toDouble() + (_sessionTimeout.minute.toDouble() / 60); 
    // double tmp = (sessionTimeout - test);
    // double timediff = ((sessionTimeout - test) - (sessionTimeout - test).truncate()) * 60;
    // print('$tmp , $timediff');

    var response = await http.get('$_baseUrl/News');

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      //debugPrint(response.body);
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