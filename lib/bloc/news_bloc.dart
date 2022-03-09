import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackernews/models/news_models.dart';
import 'package:hackernews/repositories/news_repo.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo newsRepo;
  NewsBloc({required this.newsRepo}) : super(const NewsState.loading()) {
    on<NewsEventFetch>((event, emit) async {
      emit(const NewsState.loading());
      try {
        List<News> _newsLoaded = await newsRepo.getNews(event.page);
        emit(NewsState.loaded(newsLoaded: _newsLoaded));
      } catch (e) {
        emit(const NewsState.error());
      }
    });
  }
}
