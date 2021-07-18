// import 'package:hackernews/models/newsModels.dart';
// import 'package:flutter/material.dart';

// class StateWidgetModel extends ChangeNotifier {
//   var _hackerNews = <News>[];
//   List<News> get hackerNews => _hackerNews;
// }

// class NewsModelProvider extends InheritedNotifier {
//   final StateWidgetModel model;

//   const NewsModelProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           notifier: model,
//           child: child,
//         );

//   static NewsModelProvider? of(BuildContext context) {
//     print(context.dependOnInheritedWidgetOfExactType<NewsModelProvider>());
//     return context.dependOnInheritedWidgetOfExactType<NewsModelProvider>();
//   }

//   static NewsModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType()<NewsModelProvider>()
//         ?.widget;
//     return widget is NewsModelProvider ? widget : null;
//   }
// }
