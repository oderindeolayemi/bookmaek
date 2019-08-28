import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_slide.dart';
// import '../widgets/sliding_tabbar.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>{

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return GestureDetector(
          onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SearchBar(),
              ),
              SearchSlide(),
              SliverToBoxAdapter(
                child: SizedBox(height: 10.0,),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 5.0),
                  delegate: SliverChildListDelegate([
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                  ]),
                )
              )
            ],
          )
        );
      },
    );
  }
}

// ListView(
//           children: <Widget>[
//             SearchBar(),
//             Category(title: 'Music'),
//             Category(title: 'Books'),
//             Category(title: 'Sports'),
//             Category(title: 'News'),
//             Category(title: 'Others')
//             // SlidingTabBar(tabs: 3)
//           ]
//         )