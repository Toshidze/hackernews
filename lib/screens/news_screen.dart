import 'package:flutter/material.dart';
import 'package:hackernews/models/categoryModels.dart';
import 'package:hackernews/services/news.dart';
import 'package:hackernews/utilities/convert.dart';
import 'package:hackernews/utilities/constants.dart';
import 'comment_screen.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({this.newsModelScreen, this.newsListScreen});

  final newsModelScreen;
  final newsListScreen;

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  TabController? _controller;
  final List<Category> categories = NewsCategies().categories;

  List<dynamic> newsModel = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: NewsCategies().categories.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'hacker news',
                style: kAppBarTextStyle,
              ),
              automaticallyImplyLeading: false,
              bottom: TabBar(
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Colors.black,
                labelStyle: kSelectedTextStyle,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: kunSelectedTextStyle,
                tabs: List<Widget>.generate(categories.length, (int index) {
                  return Tab(
                    text: categories[index].name,
                  );
                }),
              ),
            ),
            body: TabBarView(
              controller: _controller,
              children: List<Widget>.generate(categories.length, (int index) {
                return FutureBuilder(
                  future: getNewsModel(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: newsModel.length,
                        itemExtent: 110,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CommentScreen(
                                    news: newsModel[index],
                                  );
                                },
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.24)))),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          newsModel[index].score.toString(),
                                          style: TextStyle(
                                            fontFamily: 'FiraSans',
                                            color:
                                                Colors.black.withOpacity(0.24),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newsModel[index].title,
                                            maxLines: 2,
                                            style: kTitleTextStyle,
                                          ),
                                          Text(
                                            '${cutUrl(newsModel[index].url)}',
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontFamily: 'FiraSans',
                                              fontSize: 16, //!  16
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black
                                                  .withOpacity(0.24),
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
                                                  color: Colors.black
                                                      .withOpacity(0.74),
                                                ),
                                              ),
                                              Text(
                                                '  by ${newsModel[index].by}',
                                                style: TextStyle(
                                                  fontFamily: 'FiraSans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(0.24),
                                                ),
                                              ),
                                              Text(
                                                '  ${convertDateAgo(newsModel[index].time)}',
                                                style: TextStyle(
                                                  fontFamily: 'FiraSans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(0.24),
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
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }),
            )));
  }

  // getListModel() async {
  //   listNews = await ListModel().getList();
  //   return listNews;
  // }

  Future<List> getNewsModel() async {
    newsModel = await NewsModel().getPosts();

    return newsModel;
  }
}
