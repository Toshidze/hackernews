import 'package:flutter/material.dart';
import 'package:hackernews/screens/news_screen.dart';
import 'package:hackernews/services/news.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackernews/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  dynamic getNewsData() async {
    final newsDataInfo = await NewsModel().getPosts();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsScreen(
        newsModelScreen: newsDataInfo,
      );
    }));
  }

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
      body: Center(
        child: SpinKitPulse(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}


// Navigator.pushReplacementNamed(context, '/newsscreen');