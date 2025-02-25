import 'package:flutter/material.dart';

class CustomProgresIndicator extends StatelessWidget {
  const CustomProgresIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        heightFactor: 20,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
