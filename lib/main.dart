import 'package:flutter/material.dart';

import 'package:hackernews/screens/loading_screen.dart';
import 'package:hackernews/screens/news_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        '/load': (context) => LoadingScreen(),
        '/newsscreen': (context) => NewsScreen(),
      },
      initialRoute: '/load',
    );
  }
}
