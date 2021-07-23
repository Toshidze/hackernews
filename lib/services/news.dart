import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hackernews/models/newsModels.dart';
import 'dart:async';

import 'package:firebase/firebase_io.dart';

class ListModel {
  List<dynamic> listNews = [];
  getList() async {
    var response = await http.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;

      return data.sublist(0, 50);
    } else {
      log('error');
    }
  }
}

class NewsModel {
  FirebaseClient _client = FirebaseClient.anonymous();
  String _rootAPIPath = "https://hacker-news.firebaseio.com/v0/";
  final client = HttpClient();

  getPosts() async {
    final newsList = await ListModel().getList();
    List children = [];
    for (var item in newsList) {
      final url = Uri.parse(
          'https://hacker-news.firebaseio.com/v0/item/$item.json?print=pretty');
      final request = await client.getUrl(url);
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

  static final NewsModel _singleton = NewsModel._internal();
  NewsModel._internal();

  factory NewsModel() {
    return _singleton;
  }

  Future<News> getNewsItem(int id) async {
    var itemPath = "$_rootAPIPath/item/$id.json";

    var response = await _client.get(itemPath);

    return News.fromJson(response);
  }

  Future<List<News>> getNewsComments(News newsItem) async {
    if (newsItem.kids.length == 0) {
      return [];
    } else {
      var comments =
          await Future.wait(newsItem.kids.map((id) => getNewsItem(id)));

      var nestedComments = await Future.wait(
          comments.map((comment) => getNewsComments(comment)));

      for (var i = 0; i < nestedComments.length; i++) {
        comments[i].comments = nestedComments[i];
      }
      return comments;
    }
  }

  Future<List<dynamic>> getFeed() async {
    var path = 'newstories';
    var fullPath = "$_rootAPIPath$path.json";
    var response = await _client.get(fullPath);
    return response;
  }
}
