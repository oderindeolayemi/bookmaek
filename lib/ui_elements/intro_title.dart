import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

class IntroTitle extends StatelessWidget {
  final String title, imageUrl;

  IntroTitle(
    {
      this.title,
      this.imageUrl
    }
  );
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          // margin: EdgeInsets.only(top: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, style: (model.darkMode) ? kIntroTitleDarkModeTextStyle : kIntroTitleTextStyle),
              GestureDetector(
                onTap: ()=> Navigator.pushReplacementNamed(context, '/profile'),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/16.jpg')
                )
              )
            ]
          )
        );
      }
    );
  }
}