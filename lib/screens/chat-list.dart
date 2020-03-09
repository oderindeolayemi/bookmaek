import 'package:bookmaek/widgets/chat_divider.dart';
import 'package:bookmaek/widgets/chatbox.dart';
import 'package:bookmaek/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

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
              child: Text('Messages', style: (model.darkMode) ? kIntroTitleDarkModeTextStyle : kIntroTitleTextStyle)
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

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Scaffold(
          // appBar: AppBar(
          //   elevation: 0.0,
          //   backgroundColor: (model.darkMode) ? Colors.black : Colors.white,
          //   actions: <Widget>[
          //     IconButton(
          //       icon: Icon(Icons.add, size: 28.0, color: Colors.pink),
          //       onPressed: (){},
          //     )
          //   ]
          // ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: (model.darkMode) ? Colors.black : Colors.white,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.create, size: 28.0, color: Colors.pink),
                    onPressed: (){
                      print('Start new chat');
                    },
                  )
                ],
                // flexibleSpace: Container(color:Colors.blue, height: 20.0,),
                // bottom: PreferredSize(
                //   preferredSize: Size.infinite,
                //   child: Text('data')
                // ),
              ),
              SliverToBoxAdapter(
                child: introText(model),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/1.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  ),
                  ChatDivider(),
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/4.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  ),
                  ChatDivider(),
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/8.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  ),
                  ChatDivider(),
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/13.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  ),
                  ChatDivider(),
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/18.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  ),
                  ChatDivider(),
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/24.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  ),
                  ChatDivider(),
                  ChatBox(
                    userName: 'Sample',
                    profilePic: 'assets/images/30.jpg',
                    message: 'If you are an enterpreneur, you know that your success cannot depend on the opinion of others.',
                  )
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}