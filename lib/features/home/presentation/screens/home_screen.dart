import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_color.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/features/home/data/models/category_model.dart';
import 'package:news_app/features/home/presentation/logic/article_cubit/articles_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/get_categories_bloc_builder.dart';
import 'package:news_app/features/home/presentation/widgets/get_news_bloc_builder.dart';
import 'package:news_app/features/home/presentation/widgets/section_title_widget.dart';
import 'package:news_app/features/home/presentation/widgets/title_widget.dart';
import 'package:news_app/features/home/presentation/widgets/trending_news_cart.dart';


class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    context.read<ArticlesCubit>().getNews();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.scaffoldColor ,
        body: Container(
          margin: EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                const TitleWidget(),
                verticalSpace(15),
                const SectionTitleWidget(title: 'Hottest News'),
                verticalSpace(10),
                HomeBlocBuilder(),
                verticalSpace(5),
                const SectionTitleWidget(title: 'Explore'),
                verticalSpace(10),
                GetCategoryBlobBuilder(),
                const TrendingNewsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Your API key is: 0d9aa4ae9c0246628e098f1c214d9207
// https://newsapi.org/v2/everything?q=bitcoin&apiKey=0d9aa4ae9c0246628e098f1c214d9207
// https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=0d9aa4ae9c0246628e098f1c214d9207
