import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

import '../widgets/category.dart';
import '../widgets/category_slide.dart';

class Catalogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            Category(title: 'Music'),
            CategorySlide(posts: model.searchPosts),
            Category(title: 'Books'),
            CategorySlide(posts: model.searchPosts),
            Category(title: 'Sports'),
            CategorySlide(posts: model.searchPosts),
            Category(title: 'News'),
            CategorySlide(posts: model.searchPosts),
            Category(title: 'Others'),
            CategorySlide(posts: model.searchPosts)
          ],
        );
      }
    );
  }
}