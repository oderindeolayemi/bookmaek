import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

class Category extends StatelessWidget {
  final String title;

  Category(
    {
      @required this.title
    }
  );

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Text(title, style: kCategoryTitle),
                ),
                Expanded(
                  child: Text('View all'),
                )
              ],
            )
          )
        );
      }
    );
  }
}

// SliverGrid(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10.0),
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index){
//                     return Card(
//                       child: Column(
//                         children: <Widget>[
//                           ListTile(
//                             leading: CircleAvatar(
//                               radius: 25.0,
//                               backgroundImage: AssetImage(model.posts[index].userAvatar)
//                             ),
//                             title: Text(model.posts[index].username),
//                             subtitle: Text('2 hours ago', style: kSubtitleTextStyle),
//                             trailing: Icon(Icons.more_horiz),
//                           )
//                         ]
//                       ),
//                     );
//                   }
//                 ),
//               )

// ScopedModelDescendant<MainModel>(
        //   builder: (context, child, model){
        //     if(model.slideView){
        //       return ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: model.posts.length,
        //         itemBuilder: (context, index){
        //           return Card(
        //             child: Column(
        //               children: <Widget>[
        //                 ListTile(
        //                   leading: CircleAvatar(
        //                     radius: 25.0,
        //                     backgroundImage: AssetImage(model.posts[index].userAvatar)
        //                   ),
        //                   title: Text(model.posts[index].username),
        //                   subtitle: Text('2 hours ago', style: kSubtitleTextStyle),
        //                   trailing: Icon(Icons.more_horiz),
        //                 )
        //               ]
        //             ),
        //           );
        //         }
        //       );
        //     }else{
        //       return GridView.builder(
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //         ),
        //         itemCount: model.posts.length,
        //         itemBuilder: (context, index){
        //           return Card(
        //             child: Column(
        //               children: <Widget>[
        //                 ListTile(
        //                   leading: CircleAvatar(
        //                     radius: 25.0,
        //                     backgroundImage: AssetImage(model.posts[index].userAvatar)
        //                   ),
        //                   title: Text(model.posts[index].username),
        //                   subtitle: Text('2 hours ago', style: kSubtitleTextStyle),
        //                   trailing: Icon(Icons.more_horiz),
        //                 )
        //               ]
        //             ),
        //           );
        //         },
        //       ); 
        //     }
        //   }
        // )