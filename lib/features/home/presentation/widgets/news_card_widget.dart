import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/cpacing.dart';
import 'package:news_app/features/home/presentation/widgets/arrow_botton_widget.dart';

import '../../../../article_view.dart';

class NewsCardWidget extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String subtitle;
  final String? blogUrl;


  const NewsCardWidget(
      {super.key, this.imagePath, required this.title, required this.subtitle,this.blogUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
   Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogURL:blogUrl??'' ,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h, left: 10,right: 10.w),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imagePath ?? '',
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpace(10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    maxLines: 2,
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                verticalSpace(3),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    // overflow: TextOverflow.ellipsis,
                       maxLines: 2,
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                Spacer(),
               
                const ArrowButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
