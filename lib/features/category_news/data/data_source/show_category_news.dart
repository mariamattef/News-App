import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/category_news/data/models/show_category_model.dart';
import 'package:http/http.dart' as http;

class ShowCategoryNews {
  Future<Either<Failure, List<ShowCategoryModel>>> getCategoryNews(
      String category) async {
    List<ShowCategoryModel> categories = [];
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=0d9aa4ae9c0246628e098f1c214d9207';

    var response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['articles'] != null) {
          categories = (jsonData["articles"] as List)
              .map((data) => ShowCategoryModel.fromJson(data))
              .toList();
        }
        return Right(categories);
      } else {
        return Left(Failure(errMessage: 'Invalid category'));
      }
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
