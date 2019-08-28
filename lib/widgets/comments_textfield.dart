import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../utilities/constants.dart';

class CommentsTextField extends StatefulWidget {
  @override
  _CommentsTextFieldState createState() => _CommentsTextFieldState();
}

class _CommentsTextFieldState extends State<CommentsTextField> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model){
        return Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0
              )
            ),
            color: (model.darkMode) ? Colors.black : Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,),
                  child: TextField(
                    onChanged: (value){},
                    cursorColor: kActiveTabBarIconColor,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(color: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1))
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(color: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1))
                      ),
                      filled: true,
                      fillColor: (model.darkMode) ? Color(0xFF191919): Color(0xFFc1c1c1)
                    ),
                  )
                )
              ),
              Expanded(
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.4, 0.5, 0.9],
                      colors: [
                        Colors.orange[100],
                        Colors.orange[400],
                        Colors.orange[700],
                        Colors.orange[900]
                      ]
                    )
                  ),
                  child: IconButton(
                    onPressed: (){
                      
                    },
                    icon: Icon(Icons.send)
                  ),
                )
              )
            ],
          )
        );
      }
    );
  }
}



            //     IconButton(
            //   onPressed: (){},
            //   icon: Icon(Icons.send, color: kActiveTabBarIconColor),
            // ),