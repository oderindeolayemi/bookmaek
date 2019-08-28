import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../ui_elements/social_login_box.dart';
import '../widgets/white_button.dart';
import '../widgets/gradient_button.dart';

class LandingPage extends StatelessWidget {

  Padding landingPageBody(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Connect with', style: kLandingPageTitleTextStyle),
          Text('new friends...', style: kLandingPageTitleTextStyle),
          SizedBox(height: 25.0),
          Text('With BookMaek, you can connect with other internet users, share interests and make friends.', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white)),
          SizedBox(height: 40.0),
          WhiteButton(
            text: 'Login',
            onPressed: ()=> Navigator.pushNamed(context, '/login'),  
          ),
          SizedBox(
            height: 8.0
          ),
          GradientButton(
            text: 'Sign Up',
            onPressed: ()=> Navigator.pushNamed(context, '/register'),  
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: kLandingPageBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              landingPageBody(context),
              SizedBox(height: 50.0),
              SocialLoginBox(),
            ]
          )
        )
    );
  }
}