import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hackernews/models/news_models.dart';
import 'dart:async';

class NewsRepo {
  Future<List<dynamic>> getNewsList(page) async {
    var newsListRes = await http.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty'),
    );
    var newsListData = jsonDecode(newsListRes.body) as List<dynamic>;
    return newsListData.sublist(0, page);
  }

  Future<List<News>> getNews(page) async {
    final newsList = await getNewsList(page);
    final futureList = newsList.map((id) => getPosts(id));
    final news = await Future.wait(futureList);

    return news;
  }

  Future<News> getPosts(int id) async {
    var newsDataRes = await http.get(
      Uri.parse(
          'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty'),
    );
    var data = jsonDecode(newsDataRes.body);
    final newsData = News.fromJson(data);
    return newsData;
  }
}
