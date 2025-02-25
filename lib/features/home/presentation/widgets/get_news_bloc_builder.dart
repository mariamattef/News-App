import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/logic/article_cubit/articles_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/news_list_widget.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ArticlesFailure) {
          return Text('Error loading data');
        } else if (state is ArticlesSuccess) {
          return NewsListWidget(articles: state.articles,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
