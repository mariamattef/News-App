import 'package:flutter/material.dart';
import 'package:news_app/article_view.dart';

class NavigationHelper {
  static void navigateToArticleView(BuildContext context, String? blogURL) {
    if (blogURL != null && blogURL.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleView(blogURL: blogURL),
        ),
      );
    }
  }
}
