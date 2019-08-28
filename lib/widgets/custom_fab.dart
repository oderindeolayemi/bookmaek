import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  CustomFloatingActionButton({@required this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPressed,
      child: Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.5, 0.9],
            colors: [
              Colors.orange[100],
              Colors.orange[400],
              Colors.orange[700],
              Colors.orange[900]
            ]
          )
        ),
        child: child
      )
    );
  }
}