import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/screens/home_screen.dart';
import 'package:news_app/features/onboarding/presentation/widgets/custom_button.dart';


class CustomWidgetOnboarding extends StatelessWidget {
  const CustomWidgetOnboarding({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 1.9,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Get The Latest And Updated News Easily With Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/newspaper.png',
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomeScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
