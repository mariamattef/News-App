import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

class CustomTextLstViewTrending extends StatelessWidget {
  final ArticleModel articles;
  const CustomTextLstViewTrending({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.77,
          child: Text(
            articles.title ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        verticalSpace(5),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.9,
          child: Text(
            articles.description ?? '',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
