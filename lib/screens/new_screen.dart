import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackernews/bloc/news_bloc.dart';
import 'package:hackernews/models/news_models.dart';
import 'package:hackernews/screens/comment.dart';
import 'package:hackernews/utilities/constants.dart';
import 'package:hackernews/utilities/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final RefreshController refreshController = RefreshController();
  List<News> _currentNews = [];
  bool _isPagination = false;
  int _currentPage = 10;

  @override
  void initState() {
    if (_currentNews.isEmpty) {
      context.read<NewsBloc>().add(NewsEvent.fetch(page: _currentPage));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewsBloc>().state;
    return state.when(
      loading: () {
        if (!_isPagination) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return newsListView(_currentNews);
        }
      },
      loaded: (newsLoaded) {
        if (_isPagination) {
          _currentNews.addAll(newsLoaded);
          refreshController.loadComplete();
          _isPagination = false;
        } else {
          _currentNews = newsLoaded;
        }
        return _currentNews.isNotEmpty
            ? newsListView(_currentNews)
            : const SizedBox();
      },
      error: () => const Text('Nothing found ...'),
    );
  }

  newsListView(List<News> newsLoaded) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onRefresh: () {
        context.read<NewsBloc>().add(NewsEvent.fetch(page: _currentPage));
      },
      onLoading: () {
        _isPagination = true;
        _currentPage += 10;
        context.read<NewsBloc>().add(NewsEvent.fetch(page: _currentPage));
      },
      child: ListView.builder(
        itemCount: newsLoaded.length,
        itemExtent: 110,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Comment(
                    newsItem: newsLoaded[index],
                  );
                },
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.black.withOpacity(0.24)))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          newsLoaded[index].score.toString(),
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
                            newsLoaded[index].title,
                            maxLines: 2,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${cutUrl(newsLoaded[index].url)}',
                            maxLines: 1,
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
                                '+${newsLoaded[index].descendants}  comments',
                                style: TextStyle(
                                  fontFamily: 'FiraSans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.74),
                                ),
                              ),
                              Text(
                                '  by ${newsLoaded[index].by}',
                                style: TextStyle(
                                  fontFamily: 'FiraSans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.24),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '  ${convertDateAgo(newsLoaded[index].time)}',
                                  style: TextStyle(
                                    fontFamily: 'FiraSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.24),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
