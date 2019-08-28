import 'dart:math';
import 'package:bookmaek/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

import '../ui_elements/intro_title.dart';
import 'package:bookmaek/widgets/custom_fab.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  Card postCard(MainModel model, int index){
    ListTile postCardTitle(){
      return ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(model.posts[index].userAvatar)
        ),
        title: Text(model.posts[index].username),
        subtitle: Text('2 hours ago', style: kSubtitleTextStyle),
        trailing: Icon(Icons.more_horiz),
      );
    }

    Padding postCardHashTags(){
      return Padding(
        padding: kCardPadding,
        child: Text(model.posts[index].hashTags, style: kHashTagTextStyle),
      );
    }

    Padding postCardMessage(){
      return Padding(
        padding: kCardPadding,
        child: Text(model.posts[index].content),
      );
    }

    Row postCardBottom(){
      Row starRow(){
        return Row(
          children: <Widget>[
            IconButton(
              icon: (model.posts[index].isStarred) ?  Icon(Icons.star, color: kActiveTabBarIconColor) :  Icon(Icons.star_border),
              onPressed: ()=> model.starPosts(index),
            ),
            Text(model.posts[index].stars.toString())
          ],
        );
      }

      Row commentsRow(){
        return Row(
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.solidCommentDots),
              onPressed: (){
                Navigator.pushNamed(context, '/comments');
              },
            ),
            Text(model.posts[index].comments.toString())
          ],
        );
      }

      Row starredUsersPics(){
        return Row(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0)
                    ),
                    child: CircleAvatar(radius: 20.0,backgroundImage: AssetImage('assets/images/' + (Random().nextInt(45)+1).toString() + '.jpg'))
                  )
                ),
                Positioned(
                  left: 30.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0)
                    ),
                    child: CircleAvatar(radius: 20.0,backgroundImage: AssetImage('assets/images/' + (Random().nextInt(45)+1).toString() + '.jpg'))
                  )
                ),
                Positioned(
                  left: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0)
                    ),
                    child: CircleAvatar(radius: 20.0,backgroundImage: AssetImage('assets/images/' + (Random().nextInt(45)+1).toString() + '.jpg'))
                  )
                ),
              ],
            )
          ],
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  starRow(),
                  commentsRow()
                ],
              )
            ),
            Expanded(
              child: starredUsersPics(),
            )
          ]
        );
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          postCardTitle(),
          kSmallHeight,
          postCardHashTags(),
          kSmallHeight,
          postCardMessage(),
          kSmallHeight,
          postCardBottom(),
          kLargeHeight
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  // pinned: true,
                  // snap: true,
                  leading: Container(),
                  floating: true,
                  backgroundColor: (model.darkMode) ? Colors.black : Colors.white,
                  flexibleSpace: IntroTitle(title: 'What\'s new'),
                ),
                // SliverList(
                //   delegate: SliverChildListDelegate([
                //     IntroTitle(title: 'What\'s new'),
                //     SizedBox(height: 10.0),
                //   ])
                // ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: postCard(model, index),
                      );
                    },
                    childCount: model.posts.length,
                    addAutomaticKeepAlives: true
                  ),
                )
              ],
            )
          );
        }
      ),
      // floatingActionButton: CustomFloatingActionButton(
      //   onPressed: (){

      //   },
      //   child: Icon(FontAwesomeIcons.penFancy),
      // ),
    );
  }
}