import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_color.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Buzz',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.blueColor)),
        Text('Line',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }
}
