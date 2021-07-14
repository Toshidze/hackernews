import 'package:flutter/material.dart';
import 'package:hackernews/models/categoryModels.dart';
import 'package:hackernews/models/newsModels.dart';
import 'package:hackernews/services/news.dart';
import 'package:hackernews/utilities/values.dart';
import 'package:hackernews/utilities/constants.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({this.newsModelScreen});

  final newsModelScreen;

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  TabController _controller;
  final List<Category> categories = NewsValues().categories;
  final List<News> news = NewsValues().news;
  int index = 0;
  NewsModel newsModel = NewsModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: NewsValues().categories.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'hacker news',
                style: kAppBarTextStyle,
              ),
              bottom: TabBar(
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Colors.black,
                labelStyle: kSelectedTextStyle,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: kunSelectedTextStyle,
                tabs: List<Widget>.generate(categories.length, (int index) {
                  print(categories[0]);
                  return Tab(
                    text: categories[index].name,
                  );
                }),
              ),
            ),
            body: TabBarView(
              controller: _controller,
              children: List<Widget>.generate(categories.length, (int index) {
                return ListView.builder(
                  itemCount: 10,
                  itemExtent: 110,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.24)))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  news[0].points.toString(),
                                  style: TextStyle(
                                    fontFamily: 'FiraSans',
                                    color: Colors.black.withOpacity(0.24),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.arrow_upward,
                                  size: 16,
                                  color: Colors.black.withOpacity(0.24),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news[0].title.toString(),
                                    style: kTitleTextStyle,
                                  ),
                                  Text(
                                    news[0].site,
                                    style: TextStyle(
                                      fontFamily: 'FiraSans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.24),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '+1 point',
                                        style: TextStyle(
                                          fontFamily: 'FiraSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.74),
                                        ),
                                      ),
                                      Text(
                                        ' by ${news[0].commentAutor}',
                                        style: TextStyle(
                                          fontFamily: 'FiraSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.24),
                                        ),
                                      ),
                                      Text(
                                        ' 12 minutes ago',
                                        style: TextStyle(
                                          fontFamily: 'FiraSans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.24),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            )));
  }
}
