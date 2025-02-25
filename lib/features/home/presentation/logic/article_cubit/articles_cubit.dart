import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/datasources/news.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/article_model.dart';
part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.news) : super(ArticlesInitial());
  final News news;
  Future<void> getNews() async {
    emit(ArticlesLoading());
    try {
      Either<Failure, List<ArticleModel>> result = await news.getArticle();

      result.fold(
        (error) {
          emit(ArticlesFailure(errorMessage: error.errMessage));
        },
        (articles) {
          emit(ArticlesSuccess(articles: articles));
        },
      );
    } catch (e) {
      emit(ArticlesFailure(errorMessage: e.toString()));
    }
  }

  // Future<void>getNews() async {
  //   emit(ArticlesLoading());
  //   try {
  //     Either<Failure, List<ArticleModel>> result = await news.getArticle();
  //     // List<ArticleModel> articles = [];
  //     final articles = await news.articleModel;
  //     Either<Failure, ArticleModel> result = articles;
  //     // articles = await news.articleModel;
  //     result.fold((error) {
  //       emit(ArticlesFailure(errorMessage: error.errMessage));
  //     }, (article) {
  //       emit(ArticlesSuccess(articles: article));
  //     });
  //   } catch (e) {
  //     emit(ArticlesFailure(errorMessage: e.toString()));
  //   }
  // }
}
