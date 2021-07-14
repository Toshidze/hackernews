import 'package:flutter/material.dart';
import 'package:hackernews/models/newsModels.dart';
import 'package:hackernews/models/categoryModels.dart';

class NewsValues {
  List<News> news = [
    News(
        points: 258,
        title:
            'Tesla wants to use laser beams to automatically clean debris off cars',
        site: 'site.com',
        upPoints: 'upPoints',
        commentAutor: 'heshiebee',
        time: 1175714200,
        arrow: Icons.arrow_drop_up)
  ];
  List<Category> categories = [
    Category(name: 'new'),
    Category(name: 'past'),
    Category(name: 'comments'),
    Category(name: 'ask'),
    Category(name: 'show'),
    Category(name: 'jobs'),
    Category(name: 'submit'),
  ];
}
