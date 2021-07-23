import 'package:flutter/material.dart';

import 'package:hackernews/screens/news_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: NewsScreen(),
    );
  }
}
