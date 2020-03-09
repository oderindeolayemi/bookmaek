import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../widgets/custom_divider.dart';

class ChatBox extends StatelessWidget {
  final String userName, profilePic, message;
  ChatBox({this.userName, this.profilePic, this.message});

  Container userPic(imageUrl){
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userPic(profilePic),
          SizedBox(width: 20.0),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                  kSmallHeight,
                  Text(message, style: TextStyle(fontSize: 15.0)),
                  kSmallHeight
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}