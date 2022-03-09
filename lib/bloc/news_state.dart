part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = NewsStateLoading;
  const factory NewsState.loaded({required List<News> newsLoaded}) =
      NewsStateLoaded;
  const factory NewsState.error() = NewsStateError;
}
