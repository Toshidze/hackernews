import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hackernews/models/newsModels.dart';

class ListModel {
  List<dynamic> listNews = [];
  getList() async {
    var response = await http.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;

      return data.sublist(0, 30);
    } else {
      log('error');
    }
  }
}

class NewsModel {
  final client = HttpClient();

  getPosts() async {
    final newsList = await ListModel().getList();
    List children = [];
    for (var item in newsList) {
      final url = Uri.parse(
          'https://hacker-news.firebaseio.com/v0/item/$item.json?print=pretty');
      final test = client.getUrl(url);
      final request = await test;
      final response = await request.close();
      final jsonStrings = await response.transform(utf8.decoder).toList();
      final jsonString = jsonStrings.join();
      if (response.statusCode == 200) {
        Map<String, dynamic> json =
            jsonDecode(jsonString) as Map<String, dynamic>;

        News newJson = News.fromJson(json);

        children.add(newJson);
      } else {
        log('error');
      }
    }

    return children;
  }
}
