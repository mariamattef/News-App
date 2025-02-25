import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/category_news/presentation/screens/category_news_screen.dart';

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  const CategoryTile({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNewsScreen(
                      name: categoryName,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.asset(
                image,
                height: 110.h,
                width: 110.w,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  )),
            ),
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(34, 0, 0, 0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  )),
            ),
            Container(
              height: 110.h,
              width: 110.w,
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            // Positioned(
            //     bottom: 10,
            //     right: 10,
            //     child: )
          ],
        ),
      ),
    );
  }
}
