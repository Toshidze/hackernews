import 'package:flutter/material.dart';
import 'package:hackernews/models/newsModels.dart';
import 'package:hackernews/services/news.dart';
import 'package:hackernews/utilities/constants.dart';
import 'comment_form.dart';
import 'comment_titel.dart';

class Comment extends StatefulWidget {
  final News newsItem;
  Comment({Key? key, required this.newsItem});

  @override
  State<StatefulWidget> createState() {
    return _CommentState();
  }
}

class _CommentState extends State<Comment> {
  NewsModel newsModel = NewsModel();
  Map<int, News> comments = Map();

  Future<News> getComments(int id) async {
    var item = await newsModel.getNewsItem(id);
    item.comments = await newsModel.getNewsComments(item);
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: (widget.newsItem.kids.length == 0) ? noComments() : buildBody(),
    );
  }

  ListView buildBody() {
    return ListView.builder(
      itemCount: 1 + widget.newsItem.kids.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return CommentHeader(widget.newsItem);
        }

        return FutureBuilder(
          future: getComments(widget.newsItem.kids[index - 1]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (comments[index - 1] != null) {
              var newsItem = comments[index - 1];
              return CommentForm(
                newsItem: newsItem as News,
                key: Key(newsItem.id.toString()),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              var newsItem = snapshot.data;
              comments[index - 1] = newsItem;
              return CommentForm(
                newsItem: newsItem,
                key: Key(
                  newsItem.id.toString(),
                ),
              );
            } else if (snapshot.hasError) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Center(child: Text("Error Loading Item")),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.transparent,
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Container noComments() {
    return Container(
      child: Center(
        child: Text(
          "No comments!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        'hacker news',
        style: kAppBarTextStyle,
      ),
    );
  }
}
