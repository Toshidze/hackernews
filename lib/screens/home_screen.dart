import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackernews/bloc/news_bloc.dart';
import 'package:hackernews/models/category_models.dart';
import 'package:hackernews/repositories/news_repo.dart';
import 'package:hackernews/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabController? _controller;
  final repository = NewsRepo();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: NewsCategories().categories.length,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              backgroundColor: Colors.black,
              title: Text(
                'hacker news',
                style: kAppBarTextStyle,
              ),
              automaticallyImplyLeading: false,
              bottom: TabBar(
                padding: EdgeInsets.symmetric(vertical: 10),
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Colors.black,
                labelStyle: kSelectedTextStyle,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: kunSelectedTextStyle,
                tabs: NewsCategories().categories,
              ),
            ),
            body: BlocProvider(
              create: (context) => NewsBloc(newsRepo: repository),
              child: TabBarView(
                controller: _controller,
                children: NewsScreens().categories,
              ),
            )));
  }
}
