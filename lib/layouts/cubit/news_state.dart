part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsBottomNav extends NewsState {}

class NewsGetBusinessSuccess extends NewsState {}

class NewsGetBusinessLoading extends NewsState {}

class NewsGetBusinessError extends NewsState {
  final String error;
  NewsGetBusinessError(this.error);
}

class NewsGetSportsSuccess extends NewsState {}

class NewsGetSportsLoading extends NewsState {}

class NewsGetSportsError extends NewsState {
  final String error;
  NewsGetSportsError(this.error);
}

class NewsGetScienceSuccess extends NewsState {}

class NewsGetScienceLoading extends NewsState {}

class NewsGetScienceError extends NewsState {
  final String error;
  NewsGetScienceError(this.error);
}

class NewsChangeTheme extends NewsState {}

class NewsGetSearchLoading extends NewsState {}
class NewsGetSearchSuccess extends NewsState {}
class NewsGetSearchError extends NewsState {
  final String error;
  NewsGetSearchError(this.error);
}