import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                color:AppColor.blueColor ,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
