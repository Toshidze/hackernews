import 'package:flutter/material.dart';
import 'package:hackernews/models/newsModels.dart';
import 'package:hackernews/utilities/constants.dart';

class CommentScreen extends StatefulWidget {
  final News news;
  CommentScreen({required this.news});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
        ));
  }
}
