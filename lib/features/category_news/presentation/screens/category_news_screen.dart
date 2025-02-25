import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_color.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/core/widgets/custom_progress_indicator.dart';
import 'package:news_app/features/category_news/presentation/widgets/articles_list.dart';

import '../logic/show_article_by_category_cubit/show_article_by_category_cubit.dart';
import '../widgets/header_section.dart';

class CategoryNewsScreen extends StatefulWidget {
  String name;
  CategoryNewsScreen({super.key, required this.name});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ShowArticleByCategoryCubit>().showCategoryNews(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blueColor,
      body: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            HeaderSection(title: widget.name),
            verticalSpace(10),
            BlocBuilder<ShowArticleByCategoryCubit, ShowArticleByCategoryState>(
              builder: (context, state) {
                if (state is ShowArticleByCategoryFailure) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is ShowArticleByCategorySuccess) {
                  return Expanded(
                      child: ArticlesList(articles: state.articles));
                }
                return CustomProgresIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
