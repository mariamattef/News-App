import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/presentation/widgets/custom_widget_onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            child: Stack(
      children: [
        Image.asset(
          'assets/images/onboard.jpg',
          height: MediaQuery.of(context).size.height / 1.7,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        CustomWidgetOnboarding(),
      ],
    )));
  }
}
