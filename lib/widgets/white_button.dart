import 'package:flutter/material.dart';
// import '../utilities/constants.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  WhiteButton(
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
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(35.0)
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.orange)),
        ),
      )
    );
  }
}