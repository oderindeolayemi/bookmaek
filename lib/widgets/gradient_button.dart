import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  GradientButton(
    {
      @required this.text,
      @required this.onPressed
    }
  );
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 400.0,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kFairestShade,
              kFairShade,
              kMidShade,
              kNormalShade,
              kDeepShade,
              kDeepestShade
            ],
            stops: [
              0.1, 0.35, 0.5, 0.6, 0.75, 0.9
            ]
          )
        ),
        child: Center(
          child: Text(text, style: kGradientButtonText)
        ),
      ),
    );
  }
}