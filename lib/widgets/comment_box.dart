import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utilities/constants.dart';
import '../widgets/custom_divider.dart';

class CommentBox extends StatelessWidget {
  final String title, subtitle, profilePic, comment;

  CommentBox(
    {
      this.profilePic,
      @required this.title,
      this.subtitle,
      this.comment
    }
  );

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

  Container customDivider(){
    return Container(
      height: 3.0,
      decoration: BoxDecoration(
        color: kTabBarColor,
        border: Border.all(
          color: kTabBarColor,
          style: BorderStyle.solid
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
                  Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                  Text(subtitle, style: kSubtitleTextStyle),
                  kSmallHeight,
                  Text(comment, style: TextStyle(fontSize: 15.0)),
                  kMediumHeight,
                  Text('Reply', style: TextStyle(color: kActiveTabBarIconColor)),
                  kMediumHeight,
                  CustomDivider()
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}