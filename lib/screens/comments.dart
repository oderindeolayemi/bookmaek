import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookmaek/widgets/comments_textfield.dart';
import 'package:bookmaek/widgets/comment_box.dart';
import '../widgets/custom_divider.dart';
import '../utilities/constants.dart';

class CommentsPage extends StatelessWidget {
  Container backButton(context){
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.pop(context)
          )
        ],
      )
    );
  }

  Padding introText(MainModel model){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 35.0),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text('Comments', style: (model.darkMode) ? kIntroTitleDarkModeTextStyle : kIntroTitleTextStyle)
              ),
              Expanded(
                child: Container()
              )
            ]
          ),
          SizedBox(height: 10.0),
          CustomDivider(),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  ListView comments(){
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage('assets/images/1.jpg'),),
          title: Text('Eugene Rodriguez'),
          subtitle: Text('2 hours ago'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
        builder: (context, child, model){
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  // snap: true,
                  // floating: true,
                  backgroundColor: (model.darkMode) ? Colors.black : Colors.white,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: (model.darkMode) ? Colors.white : Colors.black),
                    onPressed: ()=> Navigator.pop(context)
                  )
                ),
                // SliverToBoxAdapter(
                //   child: backButton(context)
                // ),
                SliverToBoxAdapter(
                  child: introText(model),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    CommentBox(
                      profilePic: 'assets/images/1.jpg',
                      title: 'Eugene Rodriguez',
                      subtitle: '2 hours ago',
                      comment: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                    ),
                    CommentBox(
                      profilePic: 'assets/images/12.jpg',
                      title: 'Mabel Hanson',
                      subtitle: '3 hours ago',
                      comment: 'I\'m upset. At this moment as i sit here typing this up, I am truly upset. Something happened a little while ago.',
                    ),
                    CommentBox(
                      profilePic: 'assets/images/23.jpg',
                      title: 'Augusta Welch',
                      subtitle: '5 hours ago',
                      comment: 'Great post',
                    ),
                    CommentBox(
                      profilePic: 'assets/images/38.jpg',
                      title: 'Elon McGyver',
                      subtitle: '12 hours ago',
                      comment: 'Success is when you do  whatever makes you happy.',
                    ),
                    CommentBox(
                      profilePic: 'assets/images/44.jpg',
                      title: 'Troy Deeney',
                      subtitle: '23 hours ago',
                      comment: 'Whatever you do, never give up.',
                    )
                  ])
                )
              ],
            )
          );
        }
      ),
      bottomNavigationBar: CommentsTextField(),
    );
  }
}

// Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               backButton(context),
//               SizedBox(height: 35.0),
//               introText(),
//               SizedBox(height: 10.0),
//               Divider(color: kTabBarColor),
//               comments()
//             ]
//           ),
//         )