import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.0,
      decoration: BoxDecoration(
        color: kTabBarColor,
        border: Border.all(
          color: kTabBarColor,
          style: BorderStyle.solid
        )
      ),
    );
  }
}