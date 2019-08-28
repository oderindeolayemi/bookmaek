import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF21232f).withOpacity(0.1),
            Color(0xFF21232f).withOpacity(0.2),
            Color(0xFF21232f).withOpacity(0.3),
            Color(0xFF21232f).withOpacity(0.4),
            Color(0xFF21232f).withOpacity(0.5),
            Color(0xFF21232f).withOpacity(0.6),
            Color(0xFF21232f).withOpacity(0.7),
            Color(0xFF21232f).withOpacity(0.8),
            Color(0xFF21232f).withOpacity(0.9),
            Color(0xFF21232f),
          ],
          stops: [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Or login with', style: TextStyle(color: Colors.white, fontSize: 15.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.facebookF),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.google),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}