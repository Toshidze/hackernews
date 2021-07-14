import 'package:flutter/material.dart';

class News {
  int points;
  String title;
  String site;
  String upPoints;
  String commentAutor;
  int time;
  IconData arrow;

  News({
    @required this.points,
    @required this.title,
    @required this.site,
    @required this.upPoints,
    @required this.commentAutor,
    @required this.time,
    @required this.arrow,
  });
}
