// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsEventTearOff {
  const _$NewsEventTearOff();

  NewsEventFetch fetch({required int page}) {
    return NewsEventFetch(
      page: page,
    );
  }
}

/// @nodoc
const $NewsEvent = _$NewsEventTearOff();

/// @nodoc
mixin _$NewsEvent {
  int get page => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewsEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsEventCopyWith<NewsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res> implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  final NewsEvent _value;
  // ignore: unused_field
  final $Res Function(NewsEvent) _then;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $NewsEventFetchCopyWith<$Res>
    implements $NewsEventCopyWith<$Res> {
  factory $NewsEventFetchCopyWith(
          NewsEventFetch value, $Res Function(NewsEventFetch) then) =
      _$NewsEventFetchCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class _$NewsEventFetchCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $NewsEventFetchCopyWith<$Res> {
  _$NewsEventFetchCopyWithImpl(
      NewsEventFetch _value, $Res Function(NewsEventFetch) _then)
      : super(_value, (v) => _then(v as NewsEventFetch));

  @override
  NewsEventFetch get _value => super._value as NewsEventFetch;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(NewsEventFetch(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewsEventFetch implements NewsEventFetch {
  const _$NewsEventFetch({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'NewsEvent.fetch(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsEventFetch &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  $NewsEventFetchCopyWith<NewsEventFetch> get copyWith =>
      _$NewsEventFetchCopyWithImpl<NewsEventFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) fetch,
  }) {
    return fetch(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? fetch,
  }) {
    return fetch?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewsEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class NewsEventFetch implements NewsEvent {
  const factory NewsEventFetch({required int page}) = _$NewsEventFetch;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  $NewsEventFetchCopyWith<NewsEventFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$NewsStateTearOff {
  const _$NewsStateTearOff();

  NewsStateLoading loading() {
    return const NewsStateLoading();
  }

  NewsStateLoaded loaded({required List<News> newsLoaded}) {
    return NewsStateLoaded(
      newsLoaded: newsLoaded,
    );
  }

  NewsStateError error() {
    return const NewsStateError();
  }
}

/// @nodoc
const $NewsState = _$NewsStateTearOff();

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<News> newsLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsStateLoading value) loading,
    required TResult Function(NewsStateLoaded value) loaded,
    required TResult Function(NewsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;
}

/// @nodoc
abstract class $NewsStateLoadingCopyWith<$Res> {
  factory $NewsStateLoadingCopyWith(
          NewsStateLoading value, $Res Function(NewsStateLoading) then) =
      _$NewsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsStateLoadingCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsStateLoadingCopyWith<$Res> {
  _$NewsStateLoadingCopyWithImpl(
      NewsStateLoading _value, $Res Function(NewsStateLoading) _then)
      : super(_value, (v) => _then(v as NewsStateLoading));

  @override
  NewsStateLoading get _value => super._value as NewsStateLoading;
}

/// @nodoc

class _$NewsStateLoading implements NewsStateLoading {
  const _$NewsStateLoading();

  @override
  String toString() {
    return 'NewsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<News> newsLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsStateLoading value) loading,
    required TResult Function(NewsStateLoaded value) loaded,
    required TResult Function(NewsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NewsStateLoading implements NewsState {
  const factory NewsStateLoading() = _$NewsStateLoading;
}

/// @nodoc
abstract class $NewsStateLoadedCopyWith<$Res> {
  factory $NewsStateLoadedCopyWith(
          NewsStateLoaded value, $Res Function(NewsStateLoaded) then) =
      _$NewsStateLoadedCopyWithImpl<$Res>;
  $Res call({List<News> newsLoaded});
}

/// @nodoc
class _$NewsStateLoadedCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsStateLoadedCopyWith<$Res> {
  _$NewsStateLoadedCopyWithImpl(
      NewsStateLoaded _value, $Res Function(NewsStateLoaded) _then)
      : super(_value, (v) => _then(v as NewsStateLoaded));

  @override
  NewsStateLoaded get _value => super._value as NewsStateLoaded;

  @override
  $Res call({
    Object? newsLoaded = freezed,
  }) {
    return _then(NewsStateLoaded(
      newsLoaded: newsLoaded == freezed
          ? _value.newsLoaded
          : newsLoaded // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc

class _$NewsStateLoaded implements NewsStateLoaded {
  const _$NewsStateLoaded({required this.newsLoaded});

  @override
  final List<News> newsLoaded;

  @override
  String toString() {
    return 'NewsState.loaded(newsLoaded: $newsLoaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsStateLoaded &&
            const DeepCollectionEquality()
                .equals(other.newsLoaded, newsLoaded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newsLoaded));

  @JsonKey(ignore: true)
  @override
  $NewsStateLoadedCopyWith<NewsStateLoaded> get copyWith =>
      _$NewsStateLoadedCopyWithImpl<NewsStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<News> newsLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(newsLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call(newsLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(newsLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsStateLoading value) loading,
    required TResult Function(NewsStateLoaded value) loaded,
    required TResult Function(NewsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class NewsStateLoaded implements NewsState {
  const factory NewsStateLoaded({required List<News> newsLoaded}) =
      _$NewsStateLoaded;

  List<News> get newsLoaded;
  @JsonKey(ignore: true)
  $NewsStateLoadedCopyWith<NewsStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateErrorCopyWith<$Res> {
  factory $NewsStateErrorCopyWith(
          NewsStateError value, $Res Function(NewsStateError) then) =
      _$NewsStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsStateErrorCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsStateErrorCopyWith<$Res> {
  _$NewsStateErrorCopyWithImpl(
      NewsStateError _value, $Res Function(NewsStateError) _then)
      : super(_value, (v) => _then(v as NewsStateError));

  @override
  NewsStateError get _value => super._value as NewsStateError;
}

/// @nodoc

class _$NewsStateError implements NewsStateError {
  const _$NewsStateError();

  @override
  String toString() {
    return 'NewsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<News> newsLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<News> newsLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsStateLoading value) loading,
    required TResult Function(NewsStateLoaded value) loaded,
    required TResult Function(NewsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsStateLoading value)? loading,
    TResult Function(NewsStateLoaded value)? loaded,
    TResult Function(NewsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NewsStateError implements NewsState {
  const factory NewsStateError() = _$NewsStateError;
}
