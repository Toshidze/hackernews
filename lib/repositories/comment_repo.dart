import 'package:firebase/firebase_io.dart';
import 'package:hackernews/models/news_models.dart';

class CommentRepo {
  Map<int, News> comments = Map();
  FirebaseClient _client = FirebaseClient.anonymous();
  String _rootAPIPath = 'https://hacker-news.firebaseio.com/v0/';
  Future<News> getComments(int id) async {
    var item = await getCommentItem(id);
    item.comments = await getNewsComments(item);
    return item;
  }

  Future<News> getCommentItem(int id) async {
    var itemPath = "$_rootAPIPath/item/$id.json";
    var response = await _client.get(itemPath);
    return News.fromJson(response);
  }

  Future<List<News>> getNewsComments(News newsItem) async {
    if (newsItem.kids.length == 0) {
      return [];
    } else {
      var comments =
          await Future.wait(newsItem.kids.map((id) => getCommentItem(id)));

      var nestedComments = await Future.wait(
          comments.map((comment) => getNewsComments(comment)));

      for (var i = 0; i < nestedComments.length; i++) {
        comments[i].comments = nestedComments[i];
      }
      return comments;
    }
  }
}
