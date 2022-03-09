import 'package:flutter/material.dart';
import 'package:hackernews/models/news_models.dart';
import 'package:hackernews/widgets/build_title.dart';
import 'package:hackernews/widgets/custom_text_field.dart';

class CommentHeader extends StatelessWidget {
  final News newsItem;
  CommentHeader(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BuildTitle(newsItem: newsItem),
          CustomTextField(),
        ],
      ),
    );
  }
}
