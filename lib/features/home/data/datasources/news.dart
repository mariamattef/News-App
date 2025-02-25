import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  Future<Either<Failure, List<ArticleModel>>> getArticle() async {
    try {
      String url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=0d9aa4ae9c0246628e098f1c214d9207';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['articles'] != null) {
          List<ArticleModel> articles = (jsonData['articles'] as List)
              .map((data) => ArticleModel.fromJson(data))
              .toList();

          return Right(articles);
        } else {
          return Left(Failure(errMessage: "No articles found"));
        }
      } else {
        return Left(Failure(errMessage: "Failed to fetch articles"));
      }
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}



// class News {
//   List<ArticleModel> articleModel = [];
//   Future<void> getArticle() async {
//     String url =
//         'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=0d9aa4ae9c0246628e098f1c214d9207';
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       if (jsonData['articles'] != null) {
//         articleModel = jsonData["articles"].map((data) {
//           return ArticleModel.fromJson(data);
//         }).toList();

//       }
//       print(articleModel[0].urlToImg);
//     }
//   }
// }
