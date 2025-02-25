import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_color.dart';

class ArrowButtonWidget extends StatelessWidget {
  const ArrowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 70.w,
      margin: EdgeInsets.only(left: 130.w),
      decoration: BoxDecoration(
        color: AppColor.blueColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r)),
      ),
      child: Icon(Icons.arrow_forward, color: Colors.white, size: 25.sp),
    );
  }
}
