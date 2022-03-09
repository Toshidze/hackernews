import 'package:flutter/material.dart';
import 'package:hackernews/models/news_models.dart';
import 'package:hackernews/screens/comment_card.dart';

class CommentForm extends StatelessWidget {
  final News newsItem;
  CommentForm({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    children.add(
      CommentCard(
        key: Key("${newsItem.id}"),
        newsItem: newsItem,
      ),
    );
    if (newsItem.comments.length > 0) {
      List<Widget> comments = newsItem.comments
          .map((item) => CommentForm(
                newsItem: item,
                key: Key("${item.id}"),
              ))
          .toList();

      children.add(
        Padding(
          padding: EdgeInsets.only(left: 0),
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Container(width: 18.0),
                Expanded(
                  child: Column(children: comments),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: children);
  }
}
