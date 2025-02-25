import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/features/home/data/models/category_model.dart';
import 'package:news_app/features/home/presentation/widgets/category_tile.dart';


class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesList({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryTile(
                categoryName: categories[index].categoryName ?? 'News',
                image: categories[index].imgUrl ?? 'assets/images/news1.jpg',
              );
            },
          ),
        ),
        verticalSpace(10),
      ],
    );
  }
}