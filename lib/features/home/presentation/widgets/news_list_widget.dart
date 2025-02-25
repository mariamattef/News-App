import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/widgets/news_card_widget.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({required this.articles, super.key});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.2,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: articles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return NewsCardWidget(
              imagePath: articles[index].urlToImg,
              title: articles[index].title ?? 'No Title',
              subtitle: articles[index].description ?? '',
              blogUrl:articles[index].url ,
              );
        },
      ),
    );
  }
}
