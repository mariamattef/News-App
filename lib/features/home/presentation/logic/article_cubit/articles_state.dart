part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesSuccess extends ArticlesState {
  final List<ArticleModel> articles;

  ArticlesSuccess({required this.articles});
}

final class ArticlesFailure extends ArticlesState {
  final String errorMessage;
  ArticlesFailure({required this.errorMessage});
}
