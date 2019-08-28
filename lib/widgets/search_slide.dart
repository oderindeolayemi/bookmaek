import 'package:bookmaek/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
// import '../models/post.dart';

class SearchSlide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['Sports', 'News', 'Science & Tech', 'Music', 'Shopping'];
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return SliverToBoxAdapter(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: categories.map(
                    (e) => Container(
                      margin: EdgeInsets.all(5.0),
                      height: 90.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                        color: kTabBarColor,
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(e),
                          kSmallHeight
                        ],
                      ),
                    )
                  ).toList()
                )
              )
            )
        );
      }
    );
  }
}