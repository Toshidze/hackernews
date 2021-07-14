import 'package:flutter/material.dart';
import 'package:hackernews/screens/news_screen.dart';
import 'package:hackernews/services/news.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  void getNewsData() async {
    var newsData = await NewsModel().getNews();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsScreen(
        newsModelScreen: newsData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
