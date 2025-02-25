part of 'show_article_by_category_cubit.dart';

@immutable
sealed class ShowArticleByCategoryState {}

final class ShowArticleByCategoryInitial extends ShowArticleByCategoryState {}

final class ShowArticleByCategoryLoading extends ShowArticleByCategoryState {}

final class ShowArticleByCategorySuccess extends ShowArticleByCategoryState {
  final List<ShowCategoryModel> articles;

  ShowArticleByCategorySuccess({required this.articles});
}

final class ShowArticleByCategoryFailure extends ShowArticleByCategoryState {
  final String errorMessage;

  ShowArticleByCategoryFailure({required this.errorMessage});
}
