import 'package:animated_splash/animated_splash.dart';
import 'package:bookmaek/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './scoped_models/main.dart';

import './utilities/constants.dart';

//APP SCREENS
import './screens/landing.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/home.dart';
import './screens/comments.dart';
import './screens/profile.dart';
import './screens/browserr.dart';

void main()=> runApp(BookMaek());

class BookMaek extends StatefulWidget {
  @override
  _BookMaekState createState() => _BookMaekState();
}

class _BookMaekState extends State<BookMaek> {
  final MainModel model = MainModel();

  @override
  void initState() {
    model.checkTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: (model.darkMode == true) ? ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black.withOpacity(0.1),
          primaryColor: kTabBarColor,
          accentColor: kActiveTabBarIconColor,
          cardColor: Color(0xFF191919),
          cardTheme: CardTheme(
            elevation: 10.0
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          ),
          textTheme: TextTheme(
            body1: kDefaultBodyTextStyle,
            subhead: kDefaultBodyTextStyle.copyWith(fontWeight: FontWeight.bold),
            // subtitle: kSubtitleTextStyle
          )
        ) : ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.indigo,
          cardColor: kCardColorDay,
          accentColor: kActiveTabBarIconColor,
          cardTheme: CardTheme(
            elevation: 10.0
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          ),
          textTheme: TextTheme(
            body1: kDefaultBodyTextStyle,
            subhead: kDefaultBodyTextStyle.copyWith(fontWeight: FontWeight.bold),
            // subtitle: kSubtitleTextStyle
          )
        ),
        initialRoute: '/',
        routes: {
          '/' : (context)=> AnimatedSplash(
            imagePath: model.splashScreenImage,
            splashBackgroundImage: model.splashScreenImage,
            home: HomePage(model),
            duration: 2000,
            type: AnimatedSplashType.StaticDuration,
          ),
          '/login' : (context) => LoginPage(),
          '/register' : (context) => SignUpPage(),
          '/home' : (context) => HomePage(model),
          '/comments' : (context) => CommentsPage(),
          '/profile' : (context) => ProfilePage()
        }
      )
    );
  }
}