import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/category_news/data/data_source/show_category_news.dart';

import '../../../data/models/show_category_model.dart';

part 'show_article_by_category_state.dart';

class ShowArticleByCategoryCubit extends Cubit<ShowArticleByCategoryState> {
  ShowArticleByCategoryCubit() : super(ShowArticleByCategoryInitial());
  Future<void> showCategoryNews(String category) async {
    emit(ShowArticleByCategoryLoading());
    try {
      final showCategoryNews = ShowCategoryNews();
      Either<Failure, List<ShowCategoryModel>> article =
          await showCategoryNews.getCategoryNews(category);
      article.fold((failure) {
        emit(ShowArticleByCategoryFailure(errorMessage: failure.errMessage));
      }, (data) {
        emit(ShowArticleByCategorySuccess(articles: data));
      });
    } catch (e) {
      emit(ShowArticleByCategoryFailure(errorMessage: e.toString()));
    }
  }
}
