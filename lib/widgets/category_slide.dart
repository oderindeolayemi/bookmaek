import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../models/post.dart';

class CategorySlide extends StatelessWidget {
  final List<Post> posts;

  CategorySlide({this.posts});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return SliverToBoxAdapter(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: model.searchPosts.map(
                  (e) => Container(
                    margin: EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 2.5,
                      clipBehavior: Clip.none,
                      child: Image.asset(e.userAvatar, height: 250.0),
                    )
                  )
                ).toList()
              )
            )
        );
      }
    );
  }
}