import 'package:flutter/cupertino.dart';
import 'package:hackernews/screens/new_screen.dart';

class NewsCategories {
  final List<Widget> categories = <Widget>[
    Text('new'),
    Text('past'),
    Text('comments'),
    Text('ask'),
    Text('show'),
    Text('jobs'),
    Text('submit'),
  ];
}

class NewsScreens {
  final List<Widget> categories = <Widget>[
    NewScreen(),
    Center(child: Text('past')),
    Center(child: Text('comments')),
    Center(child: Text('ask')),
    Center(child: Text('show')),
    Center(child: Text('jobs')),
    Center(child: Text('submit')),
  ];
}
