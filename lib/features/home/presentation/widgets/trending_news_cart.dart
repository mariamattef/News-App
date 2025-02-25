import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/features/home/presentation/logic/article_cubit/articles_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/list_view_trending_items.dart';
import 'package:news_app/features/home/presentation/widgets/section_title_widget.dart';

class TrendingNewsCard extends StatelessWidget {
  const TrendingNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ArticlesFailure) {
          return Text('Error loading data');
        } else if (state is ArticlesSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitleWidget(title: 'Trending News'),
              verticalSpace(10),
              SingleChildScrollView(
                child: SizedBox(
                  child: ListView.separated(
                    itemCount: state.articles.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListViewTrendingItem(
                        articles: state.articles[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        verticalSpace(15),
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
