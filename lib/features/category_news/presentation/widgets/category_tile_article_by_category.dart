import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/cpacing.dart';

import '../../../../core/navigator_helper.dart';

class CategoryTileArticleByCategory extends StatelessWidget {
  final String? image;
  final String? title;
  final String? desc;
  final String? blogURL;
  const CategoryTileArticleByCategory(
      {super.key, this.image, this.desc, this.title, this.blogURL});
  static const String defaultImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Ar9MrU9WAt4Q63asENsBTDs0dtNUnJ9lkw&s';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return NavigationHelper.navigateToArticleView(context, blogURL);
      },
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            _buildImage(),
            verticalSpace(10),
            _buildText(title, 20, FontWeight.bold, 2, Colors.black87),
            verticalSpace(3),
            _buildText(desc, 17, FontWeight.w500, 3, Colors.black54),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image?.isNotEmpty == true ? image! : defaultImage,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.network(
          defaultImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildText(
    String? text,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    Color color,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text ?? 'No information available',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
