import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/constants.dart';

import './feeds.dart';
import './explore.dart';
import './catalogue.dart';
import './browser.dart';

class HomePage extends StatefulWidget {
  final MainModel model;
  HomePage(this.model);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget pageToLoad(MainModel model){
    if(page == 1){
      return ExplorePage();
    }else if(page == 2){
      return Catalogue();
    }else if(page == 3){
      return Browser(model);
    }else if(page == 4){
      return Center(
        child: Text('Page ' + '${page+1}'),
      );
    }else{
      return FeedsPage();
    }
  }

  int page = 0;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            color: (model.darkMode) ? kDeepestShade : Color(0xFFc1c1c1),
            // buttonBackgroundColor: kDeepestShade,
            backgroundColor: (model.darkMode) ? Colors.black : Colors.transparent,
            height: 45.0,
            items: <Widget>[
              Icon(Icons.home),
              Icon(Icons.search),
              Icon(Icons.language),
              Icon(Icons.library_books),
              Icon(Icons.email)
            ],
            onTap: (index){
              setState(() {
                page = index;
              });
            },
          ),
          body: pageToLoad(model),
        );
      }
    );
  }
}

// CupertinoTabBar(
//           backgroundColor: kTabBarColor,
//           activeColor: kActiveTabBarIconColor,
//           inactiveColor: kInactiveTabBarIconColor,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home)
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search)
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.language)
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.library_books),
//               activeIcon: Icon(Icons.library_books)
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.email)
//             )
//           ]
//         )