import 'package:flutter/material.dart';
import 'package:hackernews/models/news_models.dart';
import 'package:hackernews/repositories/comment_repo.dart';
import 'package:hackernews/utilities/constants.dart';
import 'comment_form.dart';
import 'comment_titel.dart';

class Comment extends StatelessWidget {
  Comment({Key? key, required this.newsItem});
  final News newsItem;
  final CommentRepo commentRepo = CommentRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'hacker news',
          style: kAppBarTextStyle,
        ),
      ),
      body: (newsItem.kids.length == 0) ? noComments() : buildBody(),
    );
  }

  ListView buildBody() {
    return ListView.builder(
      itemCount: 1 + newsItem.kids.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return CommentHeader(newsItem);
        }
        return FutureBuilder(
          future: commentRepo.getComments(newsItem.kids[index - 1]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (commentRepo.comments[index - 1] != null) {
              var newsItem = commentRepo.comments[index - 1];
              return CommentForm(
                newsItem: newsItem!,
                key: Key(newsItem.id.toString()),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              var newsItem = snapshot.data;
              commentRepo.comments[index - 1] = newsItem;
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

  Column noComments() {
    return Column(
      children: [
        CommentHeader(newsItem),
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                "No comments!",
                textAlign: TextAlign.center,
                style: kNoCommentsTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
