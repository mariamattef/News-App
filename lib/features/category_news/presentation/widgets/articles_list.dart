import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category_news/presentation/widgets/category_tile_article_by_category.dart';

class ArticlesList extends StatelessWidget {
  final List articles;

  const ArticlesList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return CategoryTileArticleByCategory(
            image: articles[index].urlToImg,
            title: articles[index].title,
            desc: articles[index].description,
            blogURL: articles[index].url,
          );
        },
      ),
    );
  }
}
