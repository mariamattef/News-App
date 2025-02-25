import 'package:flutter/material.dart';
import 'package:news_app/core/navigator_helper.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/widgets/custom_text_list_view_trending.dart';

class ListViewTrendingItem extends StatefulWidget {
  final ArticleModel articles;
  const ListViewTrendingItem({
    super.key,
    required this.articles,
  });

  @override
  State<ListViewTrendingItem> createState() => _ListViewTrendingItemState();
}

class _ListViewTrendingItemState extends State<ListViewTrendingItem> {
  @override
  Widget build(BuildContext context) {
    const String defaultImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Ar9MrU9WAt4Q63asENsBTDs0dtNUnJ9lkw&s';
    return GestureDetector(
      onTap: () {
        NavigationHelper.navigateToArticleView(context, widget.articles.url);
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(
                widget.articles.urlToImg?.isNotEmpty == true
                    ? widget.articles.urlToImg!
                    : defaultImage,
                height: 124,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(20),
            CustomTextLstViewTrending(
              articles: widget.articles,
            )
          ],
        ),
      ),
    );
  }
}

